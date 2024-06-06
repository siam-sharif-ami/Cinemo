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
            Button(action: {
                UserDefaults.standard.set(false, forKey: "signIn")
            }, label: {
                Text("Signout")
            })
        }
    }
}

#Preview {
    Settings()
        .environmentObject(WatchListViewModel())
}
