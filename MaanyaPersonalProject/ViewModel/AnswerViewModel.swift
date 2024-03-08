//
//  AnswerViewModel.swift
//  MaanyaPersonalProject
//
//  Created by Monal Mahajan on 3/7/24.
//

import SwiftUI
import Firebase

public class AnswerViewModel: ObservableObject, Identifiable {
    public var id = UUID()
    
    @Published private(set) var answerModel:AnswerModel = AnswerModel.placeholder
    
    init(answerModel: AnswerModel = AnswerModel.placeholder) {
        self.answerModel = answerModel
    }
    
    public func upvote() {
        answerModel.upvotes += 1
    }
    
    public func downVote() {
        answerModel.upvotes = max(answerModel.upvotes - 1, 0)
//        self.ref.collection("questions").document(self.questionModel.id).updateData(["views":self.questionModel.views])
    }
}
