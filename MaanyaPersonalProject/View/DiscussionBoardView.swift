//
//  DiscussionBoardView.swift
//  MaanyaPersonalProject
//
//  Created by Maanya Mahajan on 2/24/24.
//

import SwiftUI

public struct DiscussionBoardView: View {
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
                Text(Constants.pageTitle)
                    .font(.system(size: Constants.titleTextSize,
                                  weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 50)
                    .underline()
                
                Text(Constants.pageSubTitle)
                    .font(.system(size: Constants.subtitleTextSize,
                                  weight: .heavy))
                    .multilineTextAlignment(.center)
                
                Image("hands").resizable()
                    .frame(width: 300.0, height: 200.0)
                
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(Array(viewModel.questionsViewModel.sorted{ $0.questionModel.upvotes > $1.questionModel.upvotes}.enumerated()), id: \.element.id) { index, question in
                            QuestionView(questionModel: question,
                                         backgroundColor: index % 2 == 0 ? .orange : .yellow)
                        }
                    }
                }
            }
        }
    }
}

extension Constants {
    fileprivate static let subtitleTextSize:CGFloat = 20
    fileprivate static let pageTitle = "Discussion Board"
    fileprivate static let pageSubTitle = "Have a look at some of the most popular questions!"
    
}

