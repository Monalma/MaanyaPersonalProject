//
//  QuestionsViewModel.swift
//  MaanyaPersonalProject
//
//  Created by Monal Mahajan on 3/7/24.
//

import SwiftUI
import Firebase

public class QuestionsViewModel: ObservableObject {
    @Published private(set) var questionsViewModel = [QuestionViewModel]()
    
    let ref = Firestore.firestore()

    func getQuestions() {
        ref.collection("questions").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.questionsViewModel = documents.map { (queryDocumentSnapshot) -> QuestionViewModel in
                let data = queryDocumentSnapshot.data()
                let id = queryDocumentSnapshot.documentID
                let topic = data["page"] as? String ?? ""
                var topicConverted: Topic = .Language
                switch topic {
                case "Languages":
                    topicConverted = .Language
                case "Clothing":
                    topicConverted = .Clothing
                case "Festivals":
                    topicConverted = .Festivals
                case "Food":
                    topicConverted = .Food
                default:
                    topicConverted = .Language
                }
                
                let text = data["text"] as? String ?? ""
                let upvotes = data["upvotes"] as? Int ?? 0
                let views = data["views"] as? Int ?? 0
                let creator = data["creator"] as? String ?? ""

                return QuestionViewModel(questionModel: QuestionModel(id:id,
                                                                      topic: topicConverted,
                                                                      text: text,
                                                                      upvotes: upvotes,
                                                                      views: views,
                                                                      creator: creator))
            }
        }
    }
    
    public func addQuestion(questionViewModel: QuestionViewModel) {
        self.ref.collection("questions").addDocument(data: [
            "page":questionViewModel.questionModel.topic.string,
            "text":questionViewModel.questionModel.text,
            "upvotes":questionViewModel.questionModel.upvotes,
            "views":questionViewModel.questionModel.views,
            "creator":questionViewModel.questionModel.creator
        ])
        
        self.questionsViewModel.append(questionViewModel)
    }
}
