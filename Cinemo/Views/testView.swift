//
//  testView.swift
//  Cinemo
//
//  Created by BS00484 on 27/5/24.
//

import SwiftUI

struct testView: View {
    var text: String = "Siam"
    
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
                Capsule()
                    .stroke(lineWidth: 1)
                    .frame(width: 100,height: 20)
                    .overlay(
                        Text("PG \(text)")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    )
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .frame(height: 220)    }
}

#Preview {
    testView()
}
