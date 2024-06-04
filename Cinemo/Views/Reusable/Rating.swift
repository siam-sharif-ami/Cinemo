//
//  Rating.swift
//  Cinemo
//
//  Created by BS00484 on 4/6/24.
//

import SwiftUI

struct Rating: View {
    var rating: Double
    var body: some View {
        
        HStack{
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 12, height: 12)
                .fontWeight(.bold)
            Text(String(format: "%.1f",rating))
                .font(.caption2)
                .fontWeight(.bold)
                
        }
        
        .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
        .foregroundColor(.white)
        .background(.ultraThinMaterial)
        .overlay{
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.white, lineWidth: 1)
        }
    }
}

#Preview {
    Rating(rating: 8.7)
}
