//
//  Settings.swift
//  Cinemo
//
//  Created by BS00484 on 17/5/24.
//

import SwiftUI

struct Settings: View {
    
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
   
    @AppStorage("isDarkMode") var isDarkMode = false
    
    var body: some View {
        ZStack{
            List{
                Section{
                    HStack{
                        
                        AsyncImage(url: authenticationViewModel.userSession?.photoURL) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .shadow(radius: 3)
                            }else {
                                Image(systemName: "person.fill.questionmark")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .shadow(radius: 3)
                            }
                            
                        }
                        
                        VStack(alignment: .leading){
                            Text(authenticationViewModel.currentUser?.fullname ?? "Unknown")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .frame(width: 72, height: 72)
                            Text(authenticationViewModel.currentUser?.email ?? "Unknown")
                                .font(.footnote)
                        }
                    }
                }
                Section{
                    Button(action: {
                        authenticationViewModel.signOut()
                    }, label: {
                        Text("Signout")
                    })
                }
                Section{
                    Toggle(isOn: $isDarkMode, label: {
                                            Text("Dark Mode")
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
