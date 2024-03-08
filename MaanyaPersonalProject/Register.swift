//
//  Register.swift
//  MaanyaPersonalProject
//
//  Created by Monal Mahajan on 2/25/24.
//

import Foundation
import SwiftUI
import Firebase

public struct Register: View {
    @State private var usernameCreate: String
    @State private var passwordCreate: String
    @State private var passwordVerify: String
    @State private var email: String
    
    @State private var usernameLogin: String
    @State private var passwordLogin: String
    
    @State private var toggleCreate: Bool
    @State private var toggleLogin: Bool
    
    init() {
        self.usernameCreate = ""
        self.passwordCreate = ""
        self.passwordVerify = ""
        self.email = ""
        self.toggleCreate = false
        
        self.toggleLogin = false
        self.usernameLogin = ""
        self.passwordLogin = ""
    }
    
    public var body: some View {
        ZStack {
            Constants.generalBackground.ignoresSafeArea()
            VStack {
                Text(Constants.loginString)
                    .font(.system(size: Constants.titleTextSize,
                                  weight: .bold))
                    .multilineTextAlignment(.center)
                    .underline()
                    .foregroundStyle(.blue)
                
                TextField("Choose a Username",
                          text: $usernameCreate)
                .background(.white)
                
                SecureField(Constants.passwordString,
                            text: $passwordCreate)
                .background(.white)
                
                SecureField("Verify password",
                            text: $passwordVerify)
                .background(.white)
                
                TextField("Email",
                          text: $email)
                .background(.white)
                
                Toggle(isOn: $toggleCreate) {
                    Text("Remember me")
                }
                
                HStack {
                    Spacer()
                    
                    Button(Constants.signUpString) {
                        register()
                    }
                    .buttonStyle(.borderedProminent)
                }
                
                Rectangle()
                    .fill(.black)
                    .frame(height: 2.0)
                    .edgesIgnoringSafeArea(.horizontal)
                
                Text("Log in")
                    .font(.system(size: Constants.titleTextSize,
                                  weight: .bold))
                    .multilineTextAlignment(.center)
                    .underline()
                    .foregroundStyle(.blue)
                
                TextField("Choose a Username",
                          text: $usernameLogin)
                .background(.white)
                
                SecureField(Constants.passwordString,
                            text: $passwordLogin)
                .background(.white)
                
                Toggle(isOn: $toggleLogin) {
                    Text("Remember me")
                }
                
                HStack {
                    Spacer()
                    
                    Button(Constants.noAccountString) {
                        login()
                    }
                    .buttonStyle(.borderedProminent)
                }

            }.padding()
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: usernameLogin,
                           password: passwordLogin) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
    
    func register() {
        Auth.auth().createUser(withEmail: usernameCreate,
                               password: passwordCreate) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
}

extension Constants {
    public static let loginString = "Create an Account"
    public static let usernameString = "Username"
    public static let passwordString = "Password"
    public static let noAccountString = "Log in"
    public static let signUpString = "Sign up"
}

#Preview {
    Register()
}
