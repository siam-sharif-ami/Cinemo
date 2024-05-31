//
//  NavigationBottom.swift
//  Cinemo
//
//  Created by BS00484 on 17/5/24.
//

import SwiftUI

struct NavigationBottom: View {
    
    init() {
            // Customize the appearance of the UITabBar
            UITabBar.appearance().barTintColor = .black
        }
    var body: some View {
        ZStack{
            
            TabView{
                Home()
                    .tabItem {
                        Image(systemName: "house.fill")
                    }
                Search()
                    .tabItem{
                        Image(systemName: "magnifyingglass")
                    }
                WatchlistView()
                    .tabItem {
                        Image(systemName: "slider.horizontal.3")
                    }
                Settings()
                    .tabItem {
                        Image(systemName: "gear")
                    }
            } // Set the text color of tab labels
                
        }
    }
}

#Preview {
    NavigationBottom()
        .environmentObject(WatchListViewModel())
}
