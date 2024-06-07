//
//  SearchTabView.swift
//  Cinemo
//
//  Created by BS00484 on 24/5/24.
//

import SwiftUI

struct SearchTabView: View {
    
    var search: MovieListModel
    var body: some View {
        
        ZStack(alignment: .leading){
            
            Rectangle()
                .frame(width: .infinity, height: 180)
                .foregroundColor(Color.clear)
                .cornerRadius(20)
                .shadow(radius: 5)
            
            HStack{
                AsyncImage(url: URL(string: search.medium_cover_image)){ phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(15)
                            .shadow(radius: 5)
                        
                        
                    }
                }
                
                VStack(alignment: .leading ){
                    
                    HStack{
                        ForEach(search.genres, id: \.self){ genre in
                            Text(genre)
                                .font(.system(size: 10))
                                .foregroundColor(.primary)
                                .lineLimit(1)
                        }
                    }
                    Text("\(search.title)")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.title2)
                        .foregroundColor(.primary)
                        .lineLimit(1)
                    
                    HStack{
                        CapsuleView(text: "PG- \(search.mpa_rating)")
                            .font(.footnote)
                            .foregroundColor(.primary)
                        CapsuleView(text:"\(search.year)")
                            .foregroundColor(.primary)
                            .font(.footnote)
                        CapsuleView(text: "\(search.runtime/60)h \(search.runtime%60)m")
                            .foregroundColor(.primary)
                            .font(.footnote)
                        
                    }
                    Spacer()
                    HStack{
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        
                        
                        Text(String(format: "%.1f",search.rating))
                            .font(.footnote)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.primary)
                        
                        Spacer()
                        
                        
                    }
                }.padding(EdgeInsets(top: 15, leading: 10, bottom: 15, trailing: 10))
            }.frame(width: .infinity, height: 180)
        }
    }
}

#Preview {
    SearchTabView(search: MovieListModel.example1())
}
