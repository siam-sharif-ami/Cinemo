//
//  TabView.swift
//
//  Created by BS1002 on 21/5/24.
//

import Foundation
import SwiftUI

struct MyTab: View {
    @State private var selectedTab = 0
    let tabs = ["Image 1", "Image 2", "Image 3"]
    let indicatorHeight: CGFloat = 10 // Customize indicator height
    let indicatorColor = Color.blue // Customize indicator color
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                // TabView
                TabView(selection: self.$selectedTab) {
                    ForEach(self.tabs.indices, id: \.self) { index in
                        Image(systemName: "star.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                HStack {
                    ForEach(self.tabs.indices, id: \.self) { index in
                        if self.selectedTab == index {
                            Capsule()
                                .fill(self.indicatorColor)
                                .frame(width: 30, height: 10)
                        } else {
                            Circle()
                                .fill(.gray)
                                .frame(width: 30, height: 10)
                        }
                    }
                }.frame(height: indicatorHeight)
            }
        }.border(Color.blue)
    }
    
}


struct MyTab_Previews: PreviewProvider {
    static var previews: some View {
        MyTab()
    }
}
