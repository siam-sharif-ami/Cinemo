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
    
    @State var email: String = ""
    @State var password: String = ""
    @State var isPasswordVisible: Bool = false
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    @State var isLoggedIn:Bool = false
    @State var showLogInSuccess: Bool = false
    @State var showLogInFailed: Bool = false
    
    var body: some View {
        ZStack{
            NavigationStack{
                VStack{
                    Spacer()
                    Text("Welcome Back!")
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.primary)
                        .padding()
                    Text("Please sign in to your account")
                    
                    Spacer()
                    
                    TextField("email", text: $email)
                        .padding()
                        .foregroundColor(.primary)
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
                        .foregroundColor(.primary)
                        .background(Color(.systemGray6))
                        .cornerRadius(20)
                        .padding(.horizontal)
                    
                    
                    
                    Button(action: {
                        Task{
                            let success = await authenticationViewModel.signInWithEmailPassword(withEmail: email, password: password)
                            
                            if success {
                                isLoggedIn = true
                                showLogInSuccess = true
                            }else {
                                showLogInFailed = true
                            }
                        }
                    }){
                        Text("Login")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(20)
                            .padding()
                    }
                    .padding(.top)
                    .disabled(!formIsValid)
                    .opacity(formIsValid ? 1.0 : 0.5)
                    
                    Text("or").foregroundColor(.primary)
                    
                    Button(action: {
                        Task{
                            let success = await authenticationViewModel.signInWithGoogle()
                            if success {
                                isLoggedIn = true
                                showLogInSuccess = true
                                
                            }else {
                                showLogInFailed = true
                               
                            }
                        }
                    }, label: {
                        HStack{
                            Image("google")
                                .resizable()
                                .frame(width: 30,height: 30)
                            Text("Sign in with Google")
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.primary)
                        }.frame(width: 310,height: 40)
                    }).buttonStyle(.bordered)

                    
                    Spacer()
                    
                    HStack{
                        Text("Don't have an account?")
                        NavigationLink(destination: SignUpView()){
                            Text("Sign Up")
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                        }
                    }
                    
                    
                    Spacer()
                    
                }
                .padding()
                .alert(isPresented: $showLogInSuccess, content: {
                    Alert(
                        title: Text("Login Successful"),
                        message: Text("Redirecting to homepage "),
                        dismissButton: .default(Text("Ok"))
                    )
                })
                .alert(isPresented: $showLogInFailed, content: {
                    Alert(
                        title: Text("Login Failed"),
                        message: Text("Invalid Credentials! Check Again"),
                        dismissButton: .default(Text("Ok"))
                    )
                })
                
                NavigationLink( destination: NavigationBottom(), isActive: $isLoggedIn){
                    EmptyView()
                }
            
            }
            
        }
    }
}

extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool{
        return !email.isEmpty && email.contains("@")
        && !password.isEmpty && password.count>5
    }
}

#Preview {
    LoginView()
}
