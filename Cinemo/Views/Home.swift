//
//  Home.swift
//  Cinemo
//
//  Created by BS00484 on 17/5/24.
//

import SwiftUI


struct Home: View {
    
    @State private var movies = MovieListModel.examples()
    @State private var viewModel = ViewModel()
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading ){
                
                Header(title: "Welcome Back", user: "Siam Sharif Ami")
                
                
                /// Featured View
                ///
                ZStack{
                    HStack{
                        TabView{
                            ForEach(movies){ movie in
                                FeaturedMovie(movies: movie)
                            }
                        }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                            .frame(height: 220)
                    }
                }.padding(10)
                
                
                /// Featured View
                
                
                HStack{
                    Text("Top Movie Picks")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.title2)
                    Spacer()
                    Text("See all")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }.padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25))
                    .foregroundColor(.white)
                
                
                
                
                /// Top Movie Picks view
                ///
                ///
                ScrollView(.horizontal){
                    HStack{
                        ForEach(movies) { movie in
                            TopMoviePicks(movies: movie)
                        }
                    }
                }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                
                
                /// Top Movie picks view
                ///
                HStack{
                    Text("Upcoming Movies")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.title2)
                    Spacer()
                    Text("See all")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }.padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25))
                    .foregroundColor(.white)
                
                ScrollView(.horizontal){
                    HStack{
                        ForEach(movies){ movie in
                            UpcomingMovie(movies: movie)
                        }
                    }
                }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                
                
                /// top movie picks view
            
            }
            //end of scrollview
        }.background(Color.black.opacity(0.8))
            .onAppear(){
                Task{
                    await viewModel.fetchMovieData()
                }
            }
        
    }
}

#Preview {
    Home()
}

















