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
    @State var moviePlaceholder = MovieDetailsModel.example1()
    @State var viewModelLoaded = false
    
    var body: some View {
        ZStack{
            ZStack{
                ScrollView(.vertical){
                    VStack(alignment: .leading){
                        TabView{
                            
                            AsyncImage(url: URL(string: moviePlaceholder.medium_cover_image)){ phase in
                                if let image = phase.image{
                                    image
                                        .resizable()
                                        .frame(width: .infinity, height: 280)
                                        .cornerRadius(20)
                                        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                                }
                            }
                            
                        }.frame(width: .infinity, height: 320)
                        
                        HStack{
                            
                            ForEach( moviePlaceholder.genres , id:\.self ){ genre in
                                Text("\(genre)")
                                    .font(.subheadline)
                            }
                            
                        }
                        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                        
                        
                        Text(moviePlaceholder.title)
                            .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(.bold)
                        
                        HStack{
                            CapsuleView(text: "PG-\(moviePlaceholder.mpa_rating)")
                                .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
                                .font(.footnote)
                            CapsuleView(text: "\(moviePlaceholder.year)")
                                .font(.footnote)
                            CapsuleView(text: viewModel.runtimeFormat(moviePlaceholder.runtime))
                                .font(.footnote)
                        }
                        
                        Text(moviePlaceholder.description_full)
                            .padding()
                            .truncationMode(/*@START_MENU_TOKEN@*/.tail/*@END_MENU_TOKEN@*/)
                            .lineLimit(3)
                        
                        ButtonView(action: {}, buttonText: "Add to WatchList")
                        
                        HStack{
                            Button(action: {PersonView(movie: moviePlaceholder)}, label: {
                                Text("Cast")
                            })
                            Button(action: {}, label: {
                                Text("Writer")
                            })
                            Button(action: {}, label: {
                                Text("Director")
                            })
                        }
                        .padding()
                        
                        PersonView(movie: moviePlaceholder)
                        
                    }
                }
            }
        }
        .onAppear(){
            Task{
                await viewModel.fetchMovieDetails(movieID: id )
                viewModelLoaded = true
                moviePlaceholder = viewModel.movieDetailsDatabase?.data.movie ?? MovieDetailsModel.example1()
            }
        }
    }
}

#Preview {
    DetailsView(id: 10)
}
