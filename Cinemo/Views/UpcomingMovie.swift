//
//  UpcomingMovie.swift
//  Cinemo
//
//  Created by BS00484 on 21/5/24.
//

import SwiftUI

struct UpcomingMovie: View {
    let movies: MovieListModel
    
    var body: some View{
        VStack(alignment: .leading){
            AsyncImage(url: URL(string: movies.medium_cover_image)){phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .cornerRadius(10)
                        .frame(width: 150, height: 200)
                        .shadow(radius: 5)
                        
                        
                }
            }
            Text(movies.title)
                .font(.title3)
                .fontWeight(.semibold)
                .frame(width: 150,alignment: .leading)
                .truncationMode(/*@START_MENU_TOKEN@*/.tail/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
                .lineLimit(1)
                
            HStack{
                Text("\(movies.year)")
                Text("\(movies.mpa_rating)")
                Text("\(movies.runtime/60)h \(movies.runtime%60)m")
                    
            }.foregroundColor(.white)
                .font(.footnote)
                
        }
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
    }
}

#Preview {
    UpcomingMovie(movies: MovieListModel.example1())
}
