//
//  UserViewModel.swift
//  MaanyaPersonalProject
//
//  Created by Maanya Mahajan on 3/7/24.
//

import SwiftUI
import Firebase

public class UserViewModel: ObservableObject {
    @Published var userModel: UserModel = .placeholder
    
    let ref = NetworkManager.ref

    init(userModel: UserModel = UserModel.placeholder) {
        self.userModel = userModel
    }
    
    public func fetchUserDetails(email: String, completionBlock: ((UserModel) -> Void)? = nil) {
        ref.collection("users/").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            let users = documents.filter {
                $0.data()["email"] as? String == email
            }
            
            self.userModel = UserModel(username: users.first?.data()["name"] as? String ?? "",
                                       emailAddress: email)
            
            completionBlock?(self.userModel)
        }
    }
    
    public func writeUserDetails(userModel: UserModel) {
        self.ref.collection("users/").addDocument(data: [
            "name":userModel.username,
            "email":userModel.emailAddress
        ])
    }
}
