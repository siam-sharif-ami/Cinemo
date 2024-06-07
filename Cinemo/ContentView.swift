//
//  ContentView.swift
//  Cinemo
//
//  Created by BS00484 on 17/5/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
   // @AppStorage("isDarkMode") var isDark = false 
    
    var body: some View {
        
        Group{
            if authenticationViewModel.currentUser == nil {
                WelcomePage()
            }else {
                NavigationBottom()
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(WatchListViewModel())
        
      
}
