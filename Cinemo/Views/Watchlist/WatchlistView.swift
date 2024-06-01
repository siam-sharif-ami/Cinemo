//
//  WatchlistView.swift
//  Cinemo
//
//  Created by BS00484 on 30/5/24.
//

import SwiftUI

struct WatchlistView: View {
    
    @EnvironmentObject var watchListViewModel: WatchListViewModel
    
    var body: some View {
        ZStack{
            VStack{
                Text("WatchList")
                    .font(.title)
                    .foregroundColor(.white)
                
                
                List{
                    ForEach(watchListViewModel.watchList, id: \.id ){ movie in
                        WatchCardView(movie: movie)
                            .listRowBackground(Color.black)
                    }
                    .onDelete(perform: watchListViewModel.onDelete )
                    
                }
                .listStyle(PlainListStyle())
                .frame(maxWidth: .infinity)
                
            }
        }.background(Color.black)

    }
}

#Preview {
    WatchlistView()
        .environmentObject(WatchListViewModel())
}
