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
        NavigationView{
            VStack{
                Text("WatchList")
                    .font(.title)
                    .foregroundColor(.primary)
                
                
                List{
                    ForEach(watchListViewModel.watchList, id: \.id ){ movie in
                        NavigationLink(destination: DetailsView(movieComing: movie)){
                            WatchCardView(movie: movie)
                                .listRowBackground(Color.primary)
                        }.navigationBarBackButtonHidden()
                    }
                    .onDelete(perform: watchListViewModel.onDelete )
                    
                }
                .listStyle(PlainListStyle())
                .frame(maxWidth: .infinity)
                
            }
        }

    }
}

#Preview {
    WatchlistView()
        .environmentObject(WatchListViewModel())
}
