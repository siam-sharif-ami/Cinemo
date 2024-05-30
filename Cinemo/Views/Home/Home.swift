//
//  Home.swift
//  Cinemo
//
//  Created by BS00484 on 17/5/24.
//

import SwiftUI
import Shimmer

struct Home: View {
    
    @State private var movies = MovieListModel.examples()
    @State private var viewModel = ViewModel()
    @State private var loaded = false
    
    var body: some View {
        NavigationView{
            ScrollView(showsIndicators: false){
                VStack(alignment: .leading ){
                    
                    /// Featured View
                    ///
                    ZStack{
                        VStack(alignment: .leading){
                            Header(title: "Welcome Back", user: "Siam Sharif Ami")
                            HStack{
                                if loaded == true {
                                    TabView{
                                        if let movie = viewModel.movieDatabase?.data.movies {
                                            ForEach(movie){ phase in
                                                NavigationLink(destination: DetailsView(movieComing: phase)){
                                                    FeaturedMovie(movies: phase)
                                                }
                                            }
                                        }
                                    }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                                        .frame(height: 220)
                                }else {
                                    FeaturedMovie(movies: MovieListModel.example1())
                                        .redacted(reason: /*@START_MENU_TOKEN@*/.placeholder/*@END_MENU_TOKEN@*/)
                                        .shimmering()
                                }
                            }
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
                    let topMovieScroll = ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(viewModel.movieDatabase?.data.movies ?? movies) { phase in
                                TopMoviePicks(movies: phase)
                            }
                        }
                    }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                    
                    if loaded == true {
                        topMovieScroll
                    }else {
                        topMovieScroll
                            .redacted(reason: .placeholder)
                            .shimmering()
                    }
                    
                    
                    /// Top Movie picks view
                    /// upcoming movie view
                    HStack{
                        Text("Upcoming Movies")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .font(.title2)
                        Spacer()
                        Text("See all")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }.padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25))
                        .foregroundColor(.white)
                    
                    
                    let upcomingScroll = ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(viewModel.movieDatabase?.data.movies ?? movies ){ phase in
                                UpcomingMovie(movies: phase)
                            }
                        }
                    }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                    
                    if loaded == true {
                        upcomingScroll
                    }else{
                        upcomingScroll
                            .redacted(reason: /*@START_MENU_TOKEN@*/.placeholder/*@END_MENU_TOKEN@*/)
                            .shimmering()
                    }
                    /// upcoming movie picks view
                    
                }
                //end of scrollview
            }.background(Color.black)
                .onAppear(){
                    Task{
                        await viewModel.fetchMovieData()
                        loaded = true
                    }
                }
        }
    }
}

#Preview {
    Home()
}

















