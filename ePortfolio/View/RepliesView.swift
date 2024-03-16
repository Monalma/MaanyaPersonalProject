//
//  Answers.swift
//  MaanyaPersonalProject
//
//  Created by Maanya Mahajan on 3/4/24.
//

import Foundation
import SwiftUI

public struct RepliesView: View {
    @State private var comment: String = ""
    @ObservedObject var questionViewModel: QuestionViewModel
    var color: Background
    
    init(questionModel: QuestionViewModel,
         color: Background) {
        self.color = color
        self.questionViewModel = questionModel
        self.questionViewModel.fetchAnswers()
    }

    public var body: some View {
        
        ZStack {
            Constants.generalBackground.ignoresSafeArea()
            VStack {
                Spacer().frame(height: 10.0)
                QuestionView(questionModel: questionViewModel,
                             backgroundColor: color)
                .frame(width: 300.0,
                       height: 150.0)
                
                TextField("Add a comment",
                          text: $comment)
                .font(.title)
                .background(.white)
                .padding()
                .onSubmit {
                    questionViewModel.addAnswer(answerViewModel: AnswerViewModel(answerModel: AnswerModel(id: UUID().uuidString,
                                                                                                          text: comment,
                                                                                                          upvotes: 0)))
                    comment = ""
                }
                
                ScrollView {
                    VStack {
                        ForEach(questionViewModel.answersViewModel) { answerViewModel in
                            SingleAnswer(backgroundColor: color, answerViewModel: answerViewModel)
                        }
                    }
                }.padding(.leading)
                    .padding(.trailing)
            }
        }
    }
}
