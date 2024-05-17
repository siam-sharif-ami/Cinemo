//
//  Home.swift
//  Cinemo
//
//  Created by BS00484 on 17/5/24.
//

import SwiftUI


struct Home: View {
    @State var viewModel = MovieViewModel()
    
    var body: some View {
        ZStack {
            VStack{
                Text(viewModel.statusResponse?.status ?? "no stat")
                    .bold()
                Text(viewModel.statusResponse?.statusMessage ?? "no msg")
            }
            .onAppear{
                Task{
                    await viewModel.fetchStatusData()
                }
            }
        }
    }
    
}

#Preview {
    Home()
}
