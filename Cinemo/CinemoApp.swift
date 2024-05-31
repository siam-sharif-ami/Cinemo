//
//  CinemoApp.swift
//  Cinemo
//
//  Created by BS00484 on 17/5/24.
//

import SwiftUI

@main
struct CinemoApp: App {
    
    @StateObject var watchListViewModel:WatchListViewModel = WatchListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(watchListViewModel)
        }
    }
}
