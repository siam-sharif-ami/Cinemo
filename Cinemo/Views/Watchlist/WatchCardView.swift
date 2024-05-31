//
//  WatchCardView.swift
//  Cinemo
//
//  Created by BS00484 on 30/5/24.
//

import SwiftUI

struct WatchCardView: View {
    
    var movie: MovieListModel = MovieListModel.example1()
    
    var body: some View {
        
        ZStack(alignment: .leading){
            Rectangle()
                .frame(width: .infinity, height: 180)
                .cornerRadius(20)
                .foregroundColor(Color.black.opacity(0.7))
                .shadow(radius: 5)
            HStack{
                AsyncImage(url: URL(string: movie.medium_cover_image)){ phase in
                    
                    if let image = phase.image{
                        image
                            .resizable()
                            .frame(width: 130, height: 180)
                            .cornerRadius(20)
                            
                            .shadow(radius: 2)
                    }
                }
                
                VStack( alignment: .leading ){
                    HStack{
                        ForEach(movie.genres, id: \.self ){ genre in
                            Text("\(genre)")
                                .font(.system(size: 10))
                                .foregroundColor(.white)
                            
                        }
                    }
                    Text("\(movie.title)")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                    
                    HStack{
                        CapsuleView(text: "PG- \(movie.mpa_rating)")
                            
                            .foregroundColor(.white)
                        CapsuleView(text:"\(movie.year)")
                            .foregroundColor(.white)
                            
                        CapsuleView(text: "\(movie.runtime/60)h \(movie.runtime%60)m ")
                            .foregroundColor(.white)
                            
                    }.font(.system(size: 12))
                    
                    Spacer()
                    HStack{
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            
                            
                        Text(String(format: "%.1f",movie.rating))
                            .font(.footnote)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        
                    }
                    
                    
                    
                }.padding(EdgeInsets(top: 15, leading: 10, bottom: 15, trailing: 10))
                
            }.frame(width: .infinity, height: 180)
        }
    }
}

#Preview {
    WatchCardView()
}
