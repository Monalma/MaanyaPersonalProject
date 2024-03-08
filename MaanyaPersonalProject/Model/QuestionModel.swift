//
//  QuestionModel.swift
//  MaanyaPersonalProject
//
//  Created by Monal Mahajan on 3/7/24.
//

import Foundation
import SwiftUI

public struct QuestionModel: Identifiable, Hashable {
    public var id: String
    
    var topic: Topic
    var text: String
    var upvotes: Int
    var views: Int
    var creator: String //uid
}

public enum Topic {
    case Language
    case Clothing
    case Festivals
    case Food
    
    var string: String {
        switch self {
        case .Language:
            "Languages"
        case .Clothing:
            "Clothing"
        case .Festivals:
            "Festivals"
        case .Food:
            "Food"
        }
    }
}

extension QuestionModel {
    static let placeholder: QuestionModel = {
        QuestionModel(
            id: "dummy",
            topic: .Clothing,
            text: "This is dummy text 2",
            upvotes: 502,
            views: 22,
            creator: "monal.mahajan@hotmail.com2")
    }()
}
