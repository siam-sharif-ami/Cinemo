import Foundation
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

@MainActor
@Observable
class WatchListViewModel: ObservableObject {
    
    var currentUserID: String? {
        didSet {
            Task {
                await getFromFirebase()
            }
        }
    }
    
    var watchList: RepoData = RepoData(movies: [] ) {
        didSet {
            Task {
                await saveToFirebase()
            }
        }
    }
    
    init() {
        Auth.auth().addStateDidChangeListener { [weak self] auth, user in
            if let user = user {
                self?.currentUserID = user.uid
                print("Auth state changed: User is signed in with ID: \(user.uid)")
            } else {
                self?.currentUserID = nil
                print("Auth state changed: No user is signed in.")
            }
        }
    }
    
    func onDelete(indexSet: IndexSet) {
        watchList.movies.remove(atOffsets: indexSet)
    }
    
    func onAdd(add movie: MovieListModel) {
        if !watchList.movies.contains(where: { $0.id == movie.id }) {
            watchList.movies.append(movie)
        }
    }
    
    func getFromFirebase() async {
        guard let id = currentUserID else { return }
        
        do {
            
            let snapshot = try await Firestore.firestore().collection("Watchlists").document(id).getDocument()
            
            if let data = snapshot.data() {
                print("Document data: \(data)")
                
                self.watchList = try snapshot.data(as: RepoData.self)
                
                print("Successfully fetched watchlist from Firebase: \(self.watchList)")
            } else {
                self.watchList = RepoData(movies: [])
                print("No document found for user ID: \(id). Initializing watchList as empty.")
            }
        } catch {
            print("Error fetching watchlist from Firebase: \(error.localizedDescription)")
        }
    }
    
    func saveToFirebase() async {
        guard let id = currentUserID else {
            print("currentUserID is nil, cannot save to Firebase.")
            return
        }
        do {
            
            let encodedData = try Firestore.Encoder().encode(watchList)
            
            print("Saving watchlist to Firebase for user ID: \(id)")
            try await Firestore.firestore().collection("Watchlists").document(id).setData(encodedData)
            print("Successfully saved watchlist to Firebase: \(encodedData)")
            
        } catch {
            print("Save failed: \(error.localizedDescription)")
        }
    }
}
