//
//  Clothing.swift
//  MaanyaPersonalProject
//
//  Created by Monal Mahajan on 2/24/24.
//

import SwiftUI

public struct Clothing: View {
    @ObservedObject var viewModel: QuestionsViewModel
    
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
                Text("Clothing")
                    .font(.system(size: Constants.titleTextSize,
                                  weight: .bold))
                    .multilineTextAlignment(.center)
                    .underline()
                
                AskQuestion(topic: Topic.Clothing,
                            questionViewModel: viewModel)
                
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(Array(viewModel.questionsViewModel.filter {$0.questionModel.topic == Topic.Clothing }.enumerated()), id: \.element.id) { index, question in
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
////    Clothing()
//}
