//
//  NavigationBottom.swift
//  Cinemo
//
//  Created by BS00484 on 17/5/24.
//

import SwiftUI

struct NavigationBottom: View {
    var body: some View {
        TabView{
            Home()
                .tabItem {
                    Image(systemName: "house.fill")
                }
            Search()
                .tabItem{
                    Image(systemName: "magnifyingglass")
                }
            Menu()
                .tabItem {
                    Image(systemName: "slider.horizontal.3")
                }
            Settings()
                .tabItem {
                    Image(systemName: "gear")
                }
        }
    }
}

#Preview {
    NavigationBottom()
}
