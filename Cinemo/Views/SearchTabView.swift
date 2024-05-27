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
        
        HStack{
            AsyncImage(url: URL(string: search.medium_cover_image)){ phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(15)
                        .shadow(radius: 5)
                        
                    
                }else{
                    Text("Couldn't load image")
                }
            }.frame(width: 150)
            
            VStack{
                Spacer()
                Spacer()
                VStack(alignment:.leading){
                    VStack{
                        HStack{
                            ForEach(search.genres, id: \.self){ genre in
                                Text(genre)
                                    .font(.system(size: 10))
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .lineLimit(1)
                                if genre != search.genres.last {
                                    Circle()
                                        .frame(width: 5, height: 5)
                                }
                            }
                        }
                    }
                    Text(search.title)
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .truncationMode(/*@START_MENU_TOKEN@*/.tail/*@END_MENU_TOKEN@*/)
                        .lineLimit(2)
                    VStack(alignment: .leading){
                        HStack{
                            Capsule()
                                .stroke(lineWidth: 1)
                                .frame(width: 35,height: 20)
                                .overlay(
                                    Text("PG \(search.mpa_rating)")
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                )
                            Capsule()
                                .stroke(lineWidth: 1)
                                .frame(width: 35,height: 20)
                                .overlay(
                                    Text("\(search.year)")
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                )
                            Capsule()
                                .stroke(lineWidth: 1)
                                .frame(width: 50,height: 20)
                                .overlay(
                                    Text("\(search.runtime/60)h \(search.runtime%60)m")
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                )
                        }.font(.system(size: 10))
                    }
                    
                }
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
        }
        .foregroundColor(.white)
        .frame(width: 380,height: 180)
        .background(Color(.systemGray))
        .cornerRadius(20)
            
    }
}

#Preview {
    SearchTabView(search: MovieListModel.example1())
}
