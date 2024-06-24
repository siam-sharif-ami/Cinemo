//
//  CapsuleView.swift
//  Cinemo
//
//  Created by BS00484 on 29/5/24.
//

import SwiftUI

struct CapsuleView: View {
    
    var text: String = " "
    
    var body: some View {
        Text("\(text)")
            .font(.caption2)
            .foregroundColor(.primary)
            .fontWeight(.bold)
            .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
            .background(
                Capsule()
                    .stroke(lineWidth: 1)
            )
    }
}

#Preview {
    CapsuleView()
}
