//
//  TabView.swift
//
//  Created by BS1002 on 21/5/24.
//

import Foundation
import SwiftUI

struct MyTab: View {
    @State private var selectedTab = 0
    let tabs: [MovieListModel]
    let indicatorColor = Color.blue // Customize indicator color
    let indicatorWidth: CGFloat = 2
    
    var body: some View {
        
        VStack {
            // TabView
            TabView(selection: self.$selectedTab) {
                ForEach(self.tabs.indices, id: \.self) { index in
                    NavigationLink(destination: DetailsView(movieComing: tabs[index])){
                        FeaturedMovie(movies: tabs[index])
                    }
                }
            }
            
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            
        }.overlay(alignment: .bottom){
            HStack {
                ForEach(self.tabs.indices, id: \.self) { index in
                    if self.selectedTab == index {
                        Capsule()
                            .fill(self.indicatorColor)
                            .frame(width: 15, height: 3)
                    } else {
                        Circle()
                            .fill(.gray)
                            .frame(width: 8, height: 3)
                    }
                }
            }.frame(maxWidth: 50)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
        }.frame(width: 400, height: 250)
        
    }
    
}


#Preview{
    MyTab(tabs: MovieListModel.examples())
}
