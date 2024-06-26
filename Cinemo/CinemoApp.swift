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
   
    @StateObject var authenticationViewModel: AuthenticationViewModel = AuthenticationViewModel()
    
    @StateObject var watchListViewModel:WatchListViewModel = WatchListViewModel()
    
    @AppStorage("isDarkMode") var isDarkMode = false
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
                .environmentObject(watchListViewModel)
                .environmentObject(authenticationViewModel)
            
        }
        
    }
}
