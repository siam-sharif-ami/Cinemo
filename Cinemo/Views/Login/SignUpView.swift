//
//  SignUpView.swift
//  Cinemo
//
//  Created by BS00484 on 7/6/24.
//

import SwiftUI

struct SignUpView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    @State var fullName: String = ""
    @State var isPasswordVisible: Bool = false
    @State var isConfirmPasswordVisible: Bool = false
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    @State var signUpSuccess: Bool = false
    
    var body: some View {
            VStack{
                Text("Sign Up")
                    .font(.title)
                
                TextField("Fullname", text: $fullName)
                    .padding()
                    .foregroundColor(.primary)
                    .background(Color(.systemGray6))
                    .cornerRadius(20)
                    .padding(.horizontal)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                TextField("Email", text: $email)
                    .padding()
                    .foregroundColor(.primary)
                    .background(Color(.systemGray6))
                    .cornerRadius(20)
                    .padding(.horizontal)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .disableAutocorrection(true)
                
                HStack{
                    if isPasswordVisible{
                        TextField("Password", text: $password)
                    }else{
                        SecureField("Password", text: $password)
                        
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
                
                HStack{
                    if isConfirmPasswordVisible {
                        TextField("Confirm Password", text: $confirmPassword)
                    }else{
                        SecureField("Confirm Password", text: $confirmPassword)
                        
                    }
                    Button(action: {
                        isConfirmPasswordVisible.toggle()
                    }){
                        HStack{
                            if  !password.isEmpty && password == confirmPassword {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                            }else {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.red)
                            }
                            Image(systemName: isConfirmPasswordVisible ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(.gray)
                        }
                    }
                }.padding()
                    .foregroundColor(.primary)
                    .background(Color(.systemGray6))
                    .cornerRadius(20)
                    .padding(.horizontal)
                
                Button(action: {
                    Task{
                        let success = await authenticationViewModel.signUpwithEmailPassword(withEmail: email, password: password, withFullName: fullName)
                        
                        if success {
                            signUpSuccess = true
                        }
                    }
                }){
                    Text("Sign Up")
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
                .alert(isPresented: $signUpSuccess, content: {
                    Alert(
                        title: Text("Successfully signed Up"),
                        message: Text("Redirecting to Login Page"),
                        dismissButton: .default(Text("Ok"))
                    )
                })
                
                NavigationLink(destination: LoginView(), isActive:  $signUpSuccess){
                    EmptyView()
                }
                
            }
        
    }
}

extension SignUpView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && !fullName.isEmpty
        && confirmPassword == password
    }
}

#Preview {
    SignUpView()
}
