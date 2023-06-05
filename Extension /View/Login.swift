//
//  Login.swift
//  AuthApp
//
//  Created by Haneen on 16/11/1444 AH.
//

import SwiftUI
import FirebaseAuth
struct Login: View {
    @Binding var currentShowingView: String
    @AppStorage("uid") var userID: String = ""

    @State private var email: String = ""
    @State private var password: String = ""
    
    private func isValidPassword(_password: String) -> Bool{
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$")
        return passwordRegex.evaluate(with: password)
    }
    var body: some View {
        ZStack {
            Color.gray.edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    Text("Welcome Back !")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                    
                }
                .padding()
                .padding(.top)
                Spacer()
                HStack{
                    Image(systemName: "mail")
                    TextField("Email" , text: $email)
                    
                    Spacer()
                    if(email.count != 0){
                        Image(systemName: email.isValidEmail() ? "checkmark" : "xmark")
                            .fontWeight(.bold)
                        .foregroundColor(email.isValidEmail() ? .green : .red.opacity(0.5) )}
                    
                }
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(.black))
                
                .padding()
                HStack{
                    Image(systemName: "lock")
                    SecureField("Password" , text: $password)
                    
                    Spacer()
                    if (password.count != 0) {
                        Image(systemName: isValidPassword(_password: password) ?  "checkmark" : "xmark")
                        .fontWeight(.bold)
                        .foregroundColor( isValidPassword(_password: password) ? .green : .red .opacity(0.5))
                }
                }
                
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(.black))
                
                .padding()
                
                Button(action: {
                    withAnimation{
                    self.currentShowingView = "signup"
                }}) {
                    Text("Don't have any account?")
                        .foregroundColor(.black.opacity(0.9))
                }
                Spacer()
                Spacer()
                
                Button { Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                    if let error = error {
                        print(error)
                        return}
                    if let authResult = authResult {
                        print(authResult.user.uid)
                        withAnimation{
                        userID = authResult.user.uid
                        }
                    }
                    // ...
                  }
                    
                } label: {
                    Text("Sing In")
                        .fontWeight(.thin)
                        .foregroundColor(.white)
                        .font(.title)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 9).fill(Color.black))
                        .padding(.horizontal)
                }
            }
        }
    }}

