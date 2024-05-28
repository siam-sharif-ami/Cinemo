//
//  Rating.swift
//  Cinemo
//
//  Created by BS00484 on 28/5/24.
//

import SwiftUI

struct Rating: View {
    
    let movieDetails: MovieListModel
    var body: some View {
        
        ForEach(0..<6){ index in
            let image = movieDetails.calculateStars(at: index)
            Image(systemName: image)
        }
    }
}

#Preview {
    Rating(movieDetails: MovieListModel.example1())
}
