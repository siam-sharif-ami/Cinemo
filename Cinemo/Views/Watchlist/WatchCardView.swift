//
//  WatchCardView.swift
//  Cinemo
//
//  Created by BS00484 on 30/5/24.
//

import SwiftUI

struct WatchCardView: View {
    
    @State var id: Int
    @State var watchListViewModel = WatchListViewModel()
    
    var body: some View {
        
        ZStack(alignment: .leading){
            Rectangle()
                .frame(width: .infinity, height: 180)
                .cornerRadius(20)
                .foregroundColor(Color.black.opacity(0.7))
                .shadow(radius: 5)
            HStack{
                AsyncImage(url: URL(string: watchListViewModel.watchList[id].medium_cover_image)){ phase in
                    
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
                        ForEach(watchListViewModel.watchList[id].genres, id: \.self ){ genre in
                            Text("\(genre)")
                                .font(.system(size: 10))
                                .foregroundColor(.white)
                            
                        }
                    }
                    Text("\(watchListViewModel.watchList[id].title)")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                    
                    HStack{
                        CapsuleView(text: "PG- \(watchListViewModel.watchList[id].mpa_rating)")
                            .font(.footnote)
                            .foregroundColor(.white)
                        CapsuleView(text:"\(watchListViewModel.watchList[id].year)")
                            .foregroundColor(.white)
                            .font(.footnote)
                        CapsuleView(text: "\(watchListViewModel.runtimeFormat(watchListViewModel.watchList[id].runtime))")
                            .foregroundColor(.white)
                            .font(.footnote)
                    }
                    
                    Spacer()
                    HStack{
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            
                            
                        Text(String(format: "%.1f",watchListViewModel.watchList[id].rating))
                            .font(.footnote)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        
                    }
                    
                    
                    
                }.padding(EdgeInsets(top: 15, leading: 10, bottom: 15, trailing: 10))
                
            }.frame(width: .infinity, height: 180)
        }.padding()
    }
}

#Preview {
    WatchCardView(id: 1)
}
