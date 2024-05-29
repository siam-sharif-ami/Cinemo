//
//  PersonView.swift
//  Cinemo
//
//  Created by BS00484 on 29/5/24.
//

import SwiftUI

struct PersonView: View {
    var movie: MovieDetailsModel = MovieDetailsModel.example1()
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false ){
            HStack{
                if let castArray = movie.cast {
                    ForEach(castArray, id:\.self ){ cast in
                        if let imageURL = cast.url_small_image {
                            AsyncImage(url: URL(string: imageURL)){ phase in
                                
                                VStack(alignment: .leading){
                                    if let image = phase.image{
                                        image
                                            .resizable()
                                            .frame(width: 150,height: 150)
                                            .cornerRadius(15)
                                            
                                    }
                                    if let castCharacterName = cast.character_name {
                                        Text("\(castCharacterName)")
                                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                            .font(.subheadline)
                                            .frame(width: 150, alignment: .leading )
                                            .truncationMode(/*@START_MENU_TOKEN@*/.tail/*@END_MENU_TOKEN@*/)
                                            .lineLimit(1)
                                    }
                                    if let castRealName = cast.name {
                                        Text("\(castRealName)")
                                            .font(.subheadline)
                                            .frame(width: .infinity )
                                            .truncationMode(/*@START_MENU_TOKEN@*/.tail/*@END_MENU_TOKEN@*/)
                                            .lineLimit(1)
                                    }
                                }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                                
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    PersonView()
}
