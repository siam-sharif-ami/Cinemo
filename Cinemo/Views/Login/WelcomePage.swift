//
//  WelcomePage.swift
//  Cinemo
//
//  Created by BS00484 on 23/5/24.
//

import SwiftUI

struct WelcomePage: View {
    
    var body: some View {
        NavigationView{
            ZStack{

                VStack{
                    Spacer()
                    Spacer()
                    Image(systemName: "movieclapper.fill")
                        .font(.system(size: 100))
                    
                    Text("Cinemo")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.largeTitle)
                        .padding()
                    
                    VStack{
                        Text("Welcome to the show")
                        Text("Take your popcorn and be sitted")
                        Text("Watch your favorite movie or series")
                        
                    }.font(.subheadline)
                        .padding()
                    
                    ExtractedView()
                    
                    Spacer()
                    
                }.foregroundColor(.primary)
                
                
            }
        }.frame(width: .infinity,height: .infinity)
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
    }
}

#Preview {
    WelcomePage()
}

struct ExtractedView: View {
    
    
    
    var body: some View {
        NavigationLink(destination: LoginView()){
            Text("Get Started")
                .padding()
                .frame(width: 200, height: 50)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            
        }.padding()
    }
}
