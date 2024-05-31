//
//  ContentView.swift
//  Cinemo
//
//  Created by BS00484 on 17/5/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationBottom()
    }
}

#Preview {
    ContentView()
        .environmentObject(WatchListViewModel())
}
