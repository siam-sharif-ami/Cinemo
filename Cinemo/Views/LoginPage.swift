//
//  LoginPage.swift
//  Cinemo
//
//  Created by BS00484 on 23/5/24.
//

import SwiftUI

struct LoginPage: View {
    
    @State var username: String = ""
    @State var password: String = ""
    @State var isPasswordVisible: Bool = false
    
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                Text("Welcome Back!")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding()
                Text("Please sign in to your account")
                
                Spacer()
                
                TextField("username or email", text: $username)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding()
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .disableAutocorrection(true)
                
                
                HStack{
                    if isPasswordVisible{
                        TextField("password", text: $password)
                    }else{
                        SecureField("password", text: $password)
                            
                    }
                    Button(action: {
                        isPasswordVisible.toggle()
                    }){
                        Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                            .foregroundColor(.gray)
                    }
                }.padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                Spacer()
                
                Button(action: {
                }){
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding()
                }
                .padding(.top)
                
                HStack{
                    Text("Don't have an account?")
                    Text("Sign Up")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                
                Spacer()
                
            }
            .padding()
        }
    }
}

#Preview {
    LoginPage()
}
