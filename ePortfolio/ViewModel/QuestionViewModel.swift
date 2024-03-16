//
//  QuestionViewModel.swift
//  MaanyaPersonalProject
//
//  Created by Maanya Mahajan on 3/7/24.
//

import Firebase
import SwiftUI

public class QuestionViewModel: ObservableObject, Hashable, Identifiable {
    
    public var id = UUID()
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(questionModel.id)
    }
    
    public static func == (lhs: QuestionViewModel, rhs: QuestionViewModel) -> Bool {
        return lhs.questionModel.id == rhs.questionModel.id
    }
    
    @Published private(set) var questionModel = QuestionModel.placeholder
    @Published private(set) var answersViewModel = [AnswerViewModel]()
    
    init(questionModel: QuestionModel = QuestionModel.placeholder) {
        self.questionModel = questionModel
        updateDisplayName()
    }
    
    public func updateDisplayName() {
        let userViewModel = UserViewModel(userModel: questionModel.creator)
        userViewModel.fetchUserDetails(email: questionModel.creator.emailAddress,
                                       completionBlock: { result in
            self.questionModel.creator = result
        })
    }
    
    let ref = NetworkManager.ref
    
    public func upvote() {
        questionModel.upvotes += 1
        ref.collection("questions").document(questionModel.id).updateData(["upvotes":questionModel.upvotes])
    }
    
    public func downVote() {
        questionModel.upvotes = max(questionModel.upvotes - 1,
                                    0)
        ref.collection("questions").document(questionModel.id).updateData(["upvotes":questionModel.upvotes])
    }
    
    public func fetchAnswers() {
        ref.collection("questions/\(questionModel.id)/answers").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.answersViewModel = documents.map { (queryDocumentSnapshot) -> AnswerViewModel in
                let data = queryDocumentSnapshot.data()
                let id = queryDocumentSnapshot.documentID
                let text = data["text"] as? String ?? ""
                let upvotes = data["upvotes"] as? Int ?? 0

                return AnswerViewModel(answerModel: AnswerModel(id: id,
                                                                text: text,
                                                                upvotes: upvotes))
            }
        }
    }
    
    public func addAnswer(answerViewModel: AnswerViewModel) {
        self.answersViewModel.append(answerViewModel)
        self.ref.collection("questions/\(questionModel.id)/answers").addDocument(data: [
            "text":answerViewModel.answerModel.text,
            "upvotes":answerViewModel.answerModel.upvotes
        ])
    }
    
    public func incrementView() {
        questionModel.views += 1
        DispatchQueue.global(qos: .userInitiated).async {
            self.ref.collection("questions").document(self.questionModel.id).updateData(["views":self.questionModel.views])
        }
    }
}
