//
//  LoginPage.swift
//  Cinemo
//
//  Created by BS00484 on 23/5/24.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import GoogleSignIn
import GoogleSignInSwift

struct LoginView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    @State var isPasswordVisible: Bool = false
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    @State var isLoggedIn:Bool = false
    
    var body: some View {
        ZStack{
            NavigationStack{
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
                        .cornerRadius(20)
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
                        .cornerRadius(20)
                        .padding(.horizontal)
                    
                    
                    
                    Button(action: {
                    }){
                        Text("Login")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .padding()
                    }
                    .padding(.top)
                    
                    Text("or")
                    
                    Button(action: {
                        Task{
                            let success = await authenticationViewModel.signInWithGoogle()
                            if success {
                                isLoggedIn = true
                                print("login successfull")
                            }else {
                                print("Login failed")
                            }
                        }
                    }, label: {
                        HStack{
                            Image("google")
                                .resizable()
                                .frame(width: 30,height: 30)
                            Text("Sign in with Google")
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.black)
                        }.frame(width: 310,height: 40)
                    }).buttonStyle(.bordered)
                    
                    Spacer()
                    
                    HStack{
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                    
                    NavigationLink( destination: NavigationBottom(), isActive: $isLoggedIn){
                        EmptyView()
                    }
                
                    Spacer()
                    
                }
                .padding()
            }
            
        }
    }
}

#Preview {
    LoginView()
}
