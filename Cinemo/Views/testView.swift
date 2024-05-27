//
//  testView.swift
//  Cinemo
//
//  Created by BS00484 on 27/5/24.
//

import SwiftUI

struct testView: View {
    var body: some View {
        ScrollView(.horizontal){
            HStack{
                VStack{
                    Text("Example Value")
                    HStack{
                        Text("Hello world")
                        Image(systemName: "magnifyingglass")
                    }
                }
                Text("siam sharif")
                Text("Ami")
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .frame(height: 220)    }
}

#Preview {
    testView()
}
