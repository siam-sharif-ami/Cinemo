//
//  FeaturedMovieView.swift
//  Cinemo
//
//  Created by BS00484 on 21/5/24.
//

import SwiftUI

struct FeaturedMovie: View {
    let movies:MovieListModel

    
    var body: some View{
        
        AsyncImage(url: URL(string: movies.coverImage)){ phase in
            if let image = phase.image {
                image
                    .resizable()
                    .cornerRadius(15)
                    .shadow(radius: 5)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                
//                    .overlay(alignment: .bottomTrailing, content: {
//                        Text(movies.title)
//                            .bold()
//                            .foregroundColor(.white)
//                            .padding()
//                    })
                
            }else{
                Text("Couldn't load image")
            }
            
        }
    }
}

#Preview {
    FeaturedMovie(movies: MovieListModel.example1())
}
