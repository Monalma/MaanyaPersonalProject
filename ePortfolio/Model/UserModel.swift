//
//  UserModel.swift
//  MaanyaPersonalProject
//
//  Created by Maanya Mahajan on 3/7/24.
//

import Foundation
import SwiftUI

public struct UserModel: Identifiable, Hashable {
    public var id = UUID()
    
    var username: String
    var emailAddress: String
}

extension UserModel {
    static let placeholder: UserModel = {
        UserModel(username: "invalid",
                  emailAddress: "invalid@invalid.com")
    }()
}
