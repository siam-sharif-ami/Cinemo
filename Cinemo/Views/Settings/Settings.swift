//
//  Settings.swift
//  Cinemo
//
//  Created by BS00484 on 17/5/24.
//

import SwiftUI

struct Settings: View {
    
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    var body: some View {
        ZStack{
            List{
                Section{
                    VStack{
                        Text(authenticationViewModel.currentUser?.fullname ?? "Unknown")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 72, height: 72)
                        Text(authenticationViewModel.currentUser?.email ?? "Unknown")
                            .font(.footnote)
                    }
                }
                Section{
                    Button(action: {
                        authenticationViewModel.signOut()
                    }, label: {
                        Text("Signout")
                    })
                }
            }
        }
    }
}

#Preview {
    Settings()
        .environmentObject(WatchListViewModel())
}
