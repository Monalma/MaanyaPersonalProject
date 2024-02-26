//
//  AccountPage.swift
//  MaanyaPersonalProject
//
//  Created by Monal Mahajan on 2/25/24.
//

import Foundation
import SwiftUI
import Firebase

public struct AccountPage: View {
    @State private var username: String
    @State private var password: String
    
    init() {
        self.username = ""
        self.password = ""
    }
    
    public var body: some View {
        VStack {
            Text(Constants.loginString)
            TextField(Constants.usernameString,
                      text: $username)
            SecureField(Constants.passwordString,
                        text: $password)
            Button(Constants.noAccountString) {
                login()
            }
            Button(Constants.signUpString) {
                register()
            }
            
        }.padding()
    }
    
    func login() {
        Auth.auth().signIn(withEmail: username,
                           password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
    
    func register() {
        Auth.auth().createUser(withEmail: username,
                               password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
}

extension Constants {
    public static let loginString = "Welcome"
    public static let usernameString = "Username"
    public static let passwordString = "Password"
    public static let noAccountString = "Already have an account? Login"
    public static let signUpString = "Sign up"
}

#Preview {
    AccountPage()
}
