//
//  DetailsView.swift
//  Cinemo
//
//  Created by BS00484 on 28/5/24.
//

import SwiftUI

struct DetailsView: View {
    @State var selectedTab: String = "Cast"
    @State var id: Int
    @State var viewModel = DetailsViewModel()
    @State var moviePlaceholder = MovieDetailsModel.example1()
    @State var viewModelLoaded = false
    
    var body: some View {
        NavigationView{
            ZStack{
                ZStack{
                    ScrollView(.vertical, showsIndicators: false ){
                        VStack(alignment: .leading){
                            TabView{
                                
                                AsyncImage(url: URL(string: moviePlaceholder.medium_cover_image)){ phase in
                                    if let image = phase.image{
                                        image
                                            .resizable()
                                            .frame(width: .infinity, height: 270)
                                            .cornerRadius(20)
                                            .padding(EdgeInsets(top: 15, leading: 15, bottom: 0, trailing: 15))
                                            .shadow(radius: 5)
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
                                    PersonView(movie: moviePlaceholder)
                                }else if selectedTab == "Writer" {
                                    PersonView(movie: moviePlaceholder)
                                }else if selectedTab == "Director" {
                                    PersonView(movie: moviePlaceholder)
                                }
                            }.padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
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
        }.navigationTitle("Movie Details")
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DetailsView(id: 10)
}
