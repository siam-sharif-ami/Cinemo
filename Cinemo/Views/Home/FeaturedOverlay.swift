//
//  FeaturedOverlay.swift
//  Cinemo
//
//  Created by BS00484 on 4/6/24.
//

import SwiftUI

struct FeaturedOverlay: View {
    var movie: MovieListModel
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                VStack(alignment: .leading){
                    Text(movie.title)
                        .font(.title2)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    HStack{
                        ForEach(movie.genres, id: \.self){ genre in
                            Text("\(genre)")
                                .font(.system(size: 10))
                                .lineLimit(1)
                                .foregroundColor(.white)
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                    HStack{
                        Text("PG-\(movie.mpa_rating)")
                            .font(.caption2)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                            .background(
                                Capsule()
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.white)
                            )
                        Text("\(movie.year)")
                            .font(.caption2)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                            .background(
                                Capsule()
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.white)
                            )
                        Text("\(movie.runtime)")
                            .font(.caption2)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                            .background(
                                Capsule()
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.white)
                            )
                    }
                }
                Spacer()
                
                ButtonView(buttonText: "Add to Watchlist" , movie: movie)
                    .frame(width: 170,height: 30)
                    .padding(.bottom)
            }
            Spacer()
            
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(10)
    }
}

#Preview {
    FeaturedOverlay(movie: MovieListModel.example1())
        .environment(WatchListViewModel())
}
