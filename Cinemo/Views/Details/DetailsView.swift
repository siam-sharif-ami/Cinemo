//
//  DetailsView.swift
//  Cinemo
//
//  Created by BS00484 on 28/5/24.
//

import SwiftUI

struct DetailsView: View {
    var id: Int
    @State private var viewModel = DetailsViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
            .onAppear(){
                Task{
                    await viewModel.fetchMovieDetails(movieID: id )
                }
            }
    }
}

#Preview {
    DetailsView(id: 10)
}
