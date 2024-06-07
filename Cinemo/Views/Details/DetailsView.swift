//
//  DetailsView.swift
//  Cinemo
//
//  Created by BS00484 on 28/5/24.
//

import SwiftUI

struct DetailsView: View {
    @State var selectedTab: String = "Cast"
    @State var viewModel = DetailsViewModel()
    @State var movieComing: MovieListModel
    @State var moviePlaceholder:DetailsData = DetailsData.example1()
    @State var viewModelLoaded = false
    
    var body: some View {
        
        ZStack{
            
            VStack{
                
                Text("Movie Details")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                let shimmerView = ScrollView(.vertical, showsIndicators: false ){
                    VStack(alignment: .leading){
                      //  TabView{
                            
                            AsyncImage(url: URL(string: moviePlaceholder.data.movie.medium_cover_image)){ phase in
                                if let image = phase.image{
                                    image
                                        .resizable()
                                        .cornerRadius(20)
                                        .padding(.horizontal)
                                        .shadow(radius: 5)
                                        .frame(maxWidth: .infinity, maxHeight: 300)
                                    
                                }
                            }.padding(.vertical)
                            
                        HStack{
                            
                            ForEach( moviePlaceholder.data.movie.genres , id:\.self ){ genre in
                                Text("\(genre)")
                                    .font(.subheadline)
                                    .foregroundColor(.primary)
                                    .lineLimit(1)
                            }
                            
                        }
                        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                        
                        
                        Text(moviePlaceholder.data.movie.title)
                            .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        
                        HStack{
                            CapsuleView(text: "PG-\(moviePlaceholder.data.movie.mpa_rating)")
                                .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
                                .font(.footnote)
                            CapsuleView(text: "\(moviePlaceholder.data.movie.year)")
                                .font(.footnote)
                            CapsuleView(text: viewModel.runtimeFormat(moviePlaceholder.data.movie.runtime))
                                .font(.footnote)
                        }.foregroundColor(.primary)
                        
                        Text(moviePlaceholder.data.movie.description_full)
                            .padding()
                            .truncationMode(/*@START_MENU_TOKEN@*/.tail/*@END_MENU_TOKEN@*/)
                            .lineLimit(3)
                            .foregroundColor(.primary)
                        
                        ButtonView(buttonText: "Add to WatchList", movie: moviePlaceholder.data.movie)
                        
                        HStack{
                            Button(action: { selectedTab = "Cast" }, label: {
                                Text("Cast")
                            })
                            Button(action: { selectedTab = "Writer" }, label: {
                                Text("Writer")
                            }).disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            Button(action: { selectedTab = "Director" }, label: {
                                Text("Director")
                            }).disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        }
                        .padding()
                        
                        HStack{
                            if selectedTab == "Cast"{
                                PersonView(movie: moviePlaceholder.data.movie)
                            }else if selectedTab == "Writer" {
                                PersonView(movie: moviePlaceholder.data.movie)
                            }else if selectedTab == "Director" {
                                PersonView(movie: moviePlaceholder.data.movie)
                            }
                        }.padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
                    }
                    
                    
                }
                
                if viewModelLoaded == true {
                    shimmerView
                }else {
                    shimmerView
                        .redacted(reason: /*@START_MENU_TOKEN@*/.placeholder/*@END_MENU_TOKEN@*/)
                        .shimmering()
                    
                }
            }
        }

        .onAppear(){
            Task{
                await viewModel.fetchMovieDetails(findMovie: movieComing)
                viewModelLoaded = true
                moviePlaceholder = viewModel.movieDetailsDatabase ?? DetailsData.example1()
            }
        }
    }
}

#Preview {
    DetailsView(movieComing: MovieListModel.example1(), moviePlaceholder: DetailsData.example1())
}
