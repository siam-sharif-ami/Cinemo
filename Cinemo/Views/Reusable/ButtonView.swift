//
//  ButtonView.swift
//  Cinemo
//
//  Created by BS00484 on 29/5/24.
//

import SwiftUI

struct ButtonView: View {
    var buttonText: String
    @EnvironmentObject var watchListViewModel: WatchListViewModel
    var movie: MovieListModel
    @State private var showAlert = false
    
    var body: some View {
        Button(action: {
            watchListViewModel.onAdd(add: movie)
            showAlert = true
        }){
            Text("\(buttonText)")
                .foregroundColor(.white)
                .frame(maxWidth : .infinity)
                .padding()
                .background(
                    Rectangle()
                        .fill(Color.blue)
                        .cornerRadius(10)
                        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                )
        }
        .alert(isPresented: $showAlert, content: {
            Alert(
                title: Text("Success"),
                message: Text("Movie added to Watchlist"),
                dismissButton: .default(Text("OK"))
            )
        })
    }
}

#Preview {
    ButtonView(buttonText: "Siam", movie: MovieListModel.example1())
        .environmentObject(WatchListViewModel())
}
