//
//  WatchlistView.swift
//  Cinemo
//
//  Created by BS00484 on 30/5/24.
//

import SwiftUI

struct WatchlistView: View {
    
    @State var watchViewModel = WatchListViewModel()
    
    var body: some View {
        
        ScrollView(.vertical){
            Text("Hello World")
        }
        
    }
}

#Preview {
    WatchlistView()
}
