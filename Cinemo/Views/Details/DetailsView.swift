//
//  DetailsView.swift
//  Cinemo
//
//  Created by BS00484 on 28/5/24.
//

import SwiftUI

struct DetailsView: View {
    @State var id: Int
    @State var viewModel = DetailsViewModel()
    var dummyMovie = MovieDetailsModel.example1()
    @State var viewModelLoaded = false
    
    var body: some View {
        ZStack{
            ZStack{
                TabView{
                    if !viewModelLoaded{
                        Image(systemName: "wineglass")
                            .resizable()
                            .cornerRadius(20)
                            .frame(width: .infinity, height: 300)
                            .padding()
                            .redacted(reason: /*@START_MENU_TOKEN@*/.placeholder/*@END_MENU_TOKEN@*/)
                            .shimmering()
                    }
                    else{
                        if let movieImage = viewModel.movieDetailsDatabase?.data.movie.medium_cover_image {
                            
                            AsyncImage(url: URL(string: movieImage)){ phase in
                                if let image = phase.image{
                                    image
                                        .resizable()
                                        .cornerRadius(20)
                                        .frame(width: .infinity, height: 300)
                                        .padding()
                                }
                            }
                        }
                    }
                    
                    HStack{
                        
                    }
                    
                }
            }
        }
        
        .onAppear(){
            Task{
                await viewModel.fetchMovieDetails(movieID: id )
                viewModelLoaded = true
            }
        }
    }
}

#Preview {
    DetailsView(id: 10)
}
