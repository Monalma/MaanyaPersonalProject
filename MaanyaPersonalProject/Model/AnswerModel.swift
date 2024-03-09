//
//  AnswerModel.swift
//  MaanyaPersonalProject
//
//  Created by Maanya Mahajan on 3/7/24.
//

import Foundation
import SwiftUI

public struct AnswerModel: Identifiable, Hashable {
    public var id: String
    
    var text: String
    var upvotes: Int
}

extension AnswerModel {
    static let placeholder: AnswerModel = {
        AnswerModel(
            id: UUID().uuidString,
            text: "Incredible",
            upvotes: 1)
    }()
}
