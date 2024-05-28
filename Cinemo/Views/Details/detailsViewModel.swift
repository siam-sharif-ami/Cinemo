
import Foundation

@Observable
class DetailsViewModel {
    
    let detailsNetworkCall : DetailsNetworkCall
    var movieDetailsDatabase: MovieDetailsDatabase?
    
    init(detailsNetworkCall: DetailsNetworkCall = DetailsNetworkCall()){
        self.detailsNetworkCall = detailsNetworkCall
    }
    
    @MainActor
    func fetchMovieDetails(movieID id: Int) async {
        do {
            movieDetailsDatabase = try await detailsNetworkCall.fetchMovieDetails(movieID: id)
        }
        catch{
            print("problem in fetching movie details ")
        }
    }
    
    func calculateStars(at index: Int ) -> String{
        if let rating = movieDetailsDatabase?.data.movie.rating {
            let filledAmount = rating / 2.0
            var halfStar = rating.truncatingRemainder(dividingBy: 2.0) >= 0.5 ? true : false
            
            if filledAmount >= Double(index) {
                return "star.fill"
                
            }else if halfStar {
                
                halfStar = false
                return "star.leadinghalf.fill"
                
            }else {
                return "star"
            }
        }else{
            return "questionmark"
        }
        
    }
    
}

