//
//  Languages.swift
//  MaanyaPersonalProject
//
//  Created by Monal Mahajan on 2/24/24.
//

import SwiftUI

public struct Languages: View {
    @ObservedObject var viewModel: QuestionsViewModel
    var color: Background = .indigo
    
    init(viewModel: QuestionsViewModel) {
        self.viewModel = viewModel
    }
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    public var body: some View {
        ZStack {
            Constants.generalBackground.ignoresSafeArea()

            VStack {
                Text("Languages")
                    .font(.system(size: Constants.titleTextSize,
                                  weight: .bold))
                    .multilineTextAlignment(.center)
                    .underline()
                
                AskQuestion(topic: Topic.Language,
                            questionViewModel: viewModel)
                
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(Array(viewModel.questionsViewModel.filter {$0.questionModel.topic == Topic.Language }.enumerated()), id: \.element.id) { index, question in
                            QuestionView(questionModel: question,
                                         backgroundColor: index % 2 == 0 ? .indigo : .purple)
                        }
                    }
                }
                
                HStack {
                    Image("People").resizable().frame(width: 200, height: 150)
                    Image("Person").resizable().frame(width: 150, height: 150)
                }
            }
            
        }
    }
}

//#Preview {
//    Languages()
//}
