//
//  Header.swift
//  Cinemo
//
//  Created by BS00484 on 21/5/24.
//

import SwiftUI

struct Header: View {
    @State var title: String
    @State var user: String
    
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
                .foregroundColor(.white)
                .frame(width: .infinity, height: 20)
            
            Text(user)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.title2)
                .foregroundColor(.white)
                .frame(width: .infinity, height: 20)
                
        }.padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 0))
            
    }
}

#Preview {
    Header(title: "Welcome Back", user: "Siam Sharif Ami.")
}
