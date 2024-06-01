//
//  Settings.swift
//  Cinemo
//
//  Created by BS00484 on 17/5/24.
//

import SwiftUI

struct Settings: View {
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            Text("Settings")
                .foregroundColor(.white)
        }
    }
}

#Preview {
    Settings()
        .environmentObject(WatchListViewModel())
}
