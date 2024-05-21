//
//  TopMoviePicks.swift
//  Cinemo
//
//  Created by BS00484 on 21/5/24.
//

import SwiftUI

struct TopMoviePicks: View {
    
    let movies: MovieListModel
    
    var body: some View{
        VStack(alignment: .leading){
            AsyncImage(url: URL(string: movies.coverImage)){phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .cornerRadius(10)
                        .frame(width: 150, height: 200)
                        .shadow(radius: 5)
                        
                        
                }
            }
            Text(movies.title)
                .fontWeight(.semibold)
                .frame(width: 150,alignment: .leading)
                .truncationMode(/*@START_MENU_TOKEN@*/.tail/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
                .lineLimit(1)
                
            HStack{
                Text("\(movies.year)")
                Text("\(movies.ageRating)+")
                Text("\(movies.duration/60)h \(movies.duration%60)m")
                    
            }.foregroundColor(.white)
                .font(.subheadline)
                
        }
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
    }
}

#Preview {
    TopMoviePicks(movies: MovieListModel.example1())
}
