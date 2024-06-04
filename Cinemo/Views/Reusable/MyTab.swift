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
    let indicatorHeight: CGFloat = 5
    let indicatorWidth: CGFloat = 2
    let indicatorColor = Color.blue // Customize indicator color
    
    var body: some View {
        GeometryReader { geometry in
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
                .overlay{
                    
                    HStack {
                        ForEach(self.tabs.indices, id: \.self) { index in
                            if self.selectedTab == index {
                                Capsule()
                                    .fill(self.indicatorColor)
                                    .frame(width: 10, height: 5)
                            } else {
                                Circle()
                                    .fill(.gray)
                                    .frame(width: 10, height: 5)
                            }
                        }
                    }.frame(width: indicatorWidth ,height: indicatorHeight)
                    .padding(.top, 180)
                    
                }
            }
        }.frame(height: 220)
    }
    
}


#Preview{
    MyTab(tabs: MovieListModel.examples())
}
