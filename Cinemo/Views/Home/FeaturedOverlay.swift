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
                        .fontWeight(.bold)
                    HStack{
                        ForEach(movie.genres, id: \.self){ genre in
                            Text("\(genre)")
                                .font(.system(size: 10))
                                .lineLimit(1)
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                    HStack{
                        CapsuleView(text: "PG-\(movie.mpa_rating)")
                        CapsuleView(text: "\(movie.year)")
                        CapsuleView(text: "\(movie.runtime/60)h \(movie.runtime%60)")
                    }
                }
                Spacer()
                Text("Add to watchlist")
                    .foregroundStyle(.white)
                    .font(.caption)
                    .padding()
                    .background(
                        ButtonView(buttonText: "" , movie: movie )
                    )
            }
            
        }.foregroundColor(.primary)
            .padding()
            .background(.ultraThinMaterial .opacity(0.8))
            .cornerRadius(10)
    }
}

#Preview {
    FeaturedOverlay(movie: MovieListModel.example1())
        .environment(WatchListViewModel())
}
