//
//  Home.swift
//  Cinemo
//
//  Created by BS00484 on 17/5/24.
//

import SwiftUI
import Shimmer

struct Home: View {
    
    @State private var moviesList = MovieListModel.examples()
    @State private var viewModel = ViewModel()
    @State private var loaded = false
    
    var body: some View {
        NavigationView{
            
            ZStack{
                
                ScrollView(showsIndicators: false){
                    let fullView = VStack(alignment: .leading ){
                        
                        ZStack{
                            VStack(alignment: .leading){
                                
                                VStack(alignment: .leading){
                                    Text("Welcome Back")
                                        .foregroundColor(.white)
                                        .frame(width: .infinity, height: 20)
                                    
                                    Text("Siam Sharif Ami")
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .font(.title2)
                                        .foregroundColor(.white)
                                        .frame(width: .infinity, height: 20)
                                    
                                }.padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 0))
                                
                                HStack{
                                    MyTab(tabs: moviesList)
                                    
                                }
                            }
                            
                        }.padding(10)
                        
                        
                        HStack{
                            Text("Top Movie Picks")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .font(.title2)
                            Spacer()
                            Text("See all")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        }.padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25))
                            .foregroundColor(.white)
                        
                        ///
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack{
                                
                                ForEach( moviesList) { phase in
                                    NavigationLink(destination: DetailsView(movieComing: phase)){
                                        TopMoviePicks(movies: phase)
                                    }
                                }
                            }
                        }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                        
                        HStack{
                            Text("Upcoming Movies")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .font(.title2)
                            Spacer()
                            Text("See all")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        }.padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25))
                            .foregroundColor(.white)
                        
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack{
                                
                                ForEach( moviesList ){ phase in
                                    NavigationLink(destination: DetailsView(movieComing: phase)){
                                        UpcomingMovie(movies: phase)
                                    }
                                }
                            }
                        }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                        
                    }
                    
                    if loaded == true {
                        fullView
                    }
                    else {
                        fullView.redacted(reason: .placeholder).shimmering()
                    }
                }.background(Color.black)
            }
            
            
            
            
        }
        .onAppear(){
            Task{
                await viewModel.fetchMovieData()
                loaded = true
                moviesList = viewModel.movieDatabase?.data.movies ?? MovieListModel.examples()
            }
        }
    }
}

#Preview {
    Group{
        Home()
            .environmentObject(WatchListViewModel())
            .environment(\.locale, Locale.init(identifier: "en"))
    }
}

















