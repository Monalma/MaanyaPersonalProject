//
//  AccountPage.swift
//  MaanyaPersonalProject
//
//  Created by Maanya Mahajan on 3/4/24.
//

import Foundation
import SwiftUI

public struct UserView: View {
    @ObservedObject var userViewModel: UserViewModel
    @ObservedObject var questionsViewModel = QuestionsViewModel()
    
    init(userViewModel: UserViewModel) {
        self.userViewModel = userViewModel
        questionsViewModel.getQuestions()
    }
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    public var body: some View {
        ZStack {
            Constants.generalBackground.ignoresSafeArea()
            VStack {
                HStack {
                    Text("Username - ")
                    Text(userViewModel.userModel.username)
                }
                HStack {
                    Text("Email address - ")
                    Text(userViewModel.userModel.emailAddress)
                }
                
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(Array(questionsViewModel.questionsViewModel.filter{$0.questionModel.creator.emailAddress == userViewModel.userModel.emailAddress}.enumerated()), id: \.element.id) { index, question in
                            QuestionView(questionModel: question,
                                         backgroundColor: index % 2 == 0 ? .indigo : .purple)
                        }
                    }
                }
            }
        }
    }
}
