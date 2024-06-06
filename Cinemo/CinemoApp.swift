//
//  CinemoApp.swift
//  Cinemo
//
//  Created by BS00484 on 17/5/24.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseAuth


@main
struct CinemoApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @AppStorage("signIn") var isSignIn = false
    
    @StateObject var watchListViewModel:WatchListViewModel = WatchListViewModel()
    
    var body: some Scene {
        WindowGroup {
            
            if !isSignIn {
                WelcomePage()
            }else {
                NavigationBottom()
            }
        }
        .environmentObject(watchListViewModel)
    }
}
