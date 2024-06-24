//
//  FeaturedMovieView.swift
//  Cinemo
//
//  Created by BS00484 on 21/5/24.
//

import SwiftUI

struct FeaturedMovie: View {
    var movies:MovieListModel

    
    var body: some View{
        AsyncImage(url: URL(string: movies.medium_cover_image)){ phase in
            if let image = phase.image {
                image
                    .resizable()
                    .cornerRadius(15)
                    .shadow(radius: 5)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    .frame(height: 220)
                    .overlay{
                        Rating(rating: movies.rating)
                            .padding(EdgeInsets(top: 5, leading: 5, bottom: 160, trailing: 280))
                        
                        FeaturedOverlay(movie: movies)
                            .padding(EdgeInsets(top: 112, leading: 0, bottom: 0, trailing: 0))
                            .frame(width: 382,height: 200)
                    }
            }
        }
        
        
    }
}

#Preview {
    FeaturedMovie(movies: MovieListModel.example1())
}
