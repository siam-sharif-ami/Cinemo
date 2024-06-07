//
//  AuthenticationViewModel.swift
//  Cinemo
//
//  Created by BS00484 on 6/6/24.
//

import Foundation
import FirebaseCore
import FirebaseAuth
import GoogleSignIn
import GoogleSignInSwift
import FirebaseFirestore
import FirebaseFirestoreSwift

@MainActor
class AuthenticationViewModel : ObservableObject{
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: UserInfo?
    
    init(){
        self.userSession = Auth.auth().currentUser
        Task{
            await fetchUser()
        }
    }
}

enum AuthenticationError: Error {
    case tokenError(message: String)
}

extension AuthenticationViewModel {
    func signInWithGoogle() async -> Bool {
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            fatalError("No client ID found in Firebase configuration")
        }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        guard let windowScene = await UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = await windowScene.windows.first,
              let rootViewController = await window.rootViewController else {
            print("There is no root view controller")
            return false
        }
        
        do {
            let userAuthentication = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController)
            let user = userAuthentication.user
            guard let idToken = user.idToken else {
                throw AuthenticationError.tokenError(message: "ID token missing")
            }
            let accesstoken = user.accessToken
            let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: accesstoken.tokenString)
            let result = try await Auth.auth().signIn(with: credential)
            let firebaseUser = result.user
            
            // create a user in firestore
            let userfetched = UserInfo(id: firebaseUser.uid, fullname: firebaseUser.displayName , email: firebaseUser.email)
            let encodedUser = try Firestore.Encoder().encode(userfetched)
            if let id = userfetched.id {
                try await Firestore.firestore().collection("users").document(id).setData(encodedUser)
            }else {
                print("error fetching user id")
            }
            await fetchUser()
            return true
        }catch{
            print(error.localizedDescription)
            //errorMessage = error.localizedDescription
            return false
        }
    }
    
    func signUpwithEmailPassword(withEmail email: String , password:String, withFullName fullName: String) async -> Bool{
        do{
            let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
            
            let firebaseUser = authResult.user
    
            let userfetched = UserInfo(id: firebaseUser.uid, fullname: fullName , email: firebaseUser.email)
            let encodedUser = try Firestore.Encoder().encode(userfetched)
            
            if let id = userfetched.id {
                try await Firestore.firestore().collection("users").document(id).setData(encodedUser)
            }else {
                print("error fetching user id")
            }
            return true
        }catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    func signInWithEmailPassword(withEmail email:String, password: String) async -> Bool {
        do{
            let user = try await Auth.auth().signIn( withEmail: email, password: password )
            await fetchUser()
            return true
        }catch{
            print("Credentials don't match")
            return false
        }
        
    }
    
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else {return}
        self.currentUser = try? snapshot.data(as: UserInfo.self)
        print("Debug: Current user is \(self.currentUser)")
    }
    
    func signOut() {
        do{
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        }catch{
            print(error.localizedDescription)
        }
    }
    
}
