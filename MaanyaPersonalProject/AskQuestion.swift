//
//  AskQuestion.swift
//  MaanyaPersonalProject
//
//  Created by Monal Mahajan on 3/3/24.
//

import Foundation
import SwiftUI

public struct AskQuestion: View {
    private let topic: Topic
    @ObservedObject var questionsViewModel: QuestionsViewModel
    
    init(topic: Topic,
         questionViewModel: QuestionsViewModel) {
        self.topic = topic
        self.questionsViewModel = questionViewModel
    }
    
    @State private var text: String = ""
    
    public var body: some View {
        HStack {
            Button {
                
            } label: {
                Image(systemName: "person.crop.circle")
                    .foregroundStyle(.black)
            }
            
            TextField(text: $text, label: {
                Text("Ask a Question")
            })
            .onSubmit {
                questionsViewModel.addQuestion(questionViewModel: QuestionViewModel(questionModel: QuestionModel(
                    id:UUID().uuidString,
                    topic: topic,
                    text: text,
                    upvotes: 0,
                    views: 0,
                    creator: "Dummy creator")))
                text = ""
            }
        }
        .padding(.top, 5.0)
        .padding(.bottom, 5.0)
        .background(.white)
        .padding(.leading)
        .padding(.trailing)
    }
}
