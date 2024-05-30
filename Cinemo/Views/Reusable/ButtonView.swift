//
//  ButtonView.swift
//  Cinemo
//
//  Created by BS00484 on 29/5/24.
//

import SwiftUI

struct ButtonView: View {
    let action: () -> Void
    let buttonText: String
    @EnvironmentObject var watchListViewModel: WatchListViewModel
    
    
    var body: some View {
        Button(action: {}){
            Text("Add to Watchlist")
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
    }
}

#Preview {
    ButtonView(action: {
        print("button tapped")
    }, buttonText: "Siam")
}
