//
//  QuestionView.swift
//  MaanyaPersonalProject
//
//  Created by Maanya Mahajan on 3/3/24.
//

import Foundation
import SwiftUI

public struct QuestionView: View {
    var questionViewModel: QuestionViewModel
    let backgroundColor: Background
    @EnvironmentObject var userViewModel: UserViewModel
    
    init(questionModel: QuestionViewModel,
         backgroundColor: Background) {
        self.questionViewModel = questionModel
        self.backgroundColor = backgroundColor
    }
    
    @State private var showingPopoverAnswers = false
    @State private var showingPopoverUser = false
    
    public var body: some View {
        ZStack {
            backgroundColor.color.ignoresSafeArea()
            VStack {
                HStack(alignment: .top) {
                    VStack {
                        Button {
                            questionViewModel.upvote()
                        } label: {
                            Image(systemName: "arrowshape.up.fill")
                                .tint(Color.red)
                        }
                        
                        Text(String(questionViewModel.questionModel.upvotes))
                            .font(.system(size: 14.0))
                        
                        Button {
                            questionViewModel.downVote()
                        } label: {
                            Image(systemName: "arrowshape.down.fill")
                                .tint(Color.black)
                        }
                    }
                    Text(questionViewModel.questionModel.text)
                        .font(.system(size: 30.0))
                        .foregroundStyle(.blue)
                        .multilineTextAlignment(.center)
                }
                
                HStack(alignment: .bottom) {
                    Button {
                        showingPopoverUser = true
                    } label: {
                        VStack {
                            Image(systemName: "person.crop.circle")
                            Text("User")
                        }.foregroundStyle(.black)
                    }
                    .sheet(isPresented: $showingPopoverUser) {
                        UserView(userViewModel: UserViewModel(userModel: questionViewModel.questionModel.creator))
                    }
                    
                    Button {
                        showingPopoverAnswers = true
                    } label: {
                        VStack {
                            Image(systemName: "message")
                            Text("Answers")
                        }.foregroundStyle(.black)
                    }
                    .sheet(isPresented: $showingPopoverAnswers,
                           onDismiss: {
                        questionViewModel.incrementView()
                    }, content: {
                        RepliesView(questionModel: questionViewModel,
                                    color: backgroundColor)
                    })
                    
                    VStack {
                        Image(systemName: "eye")
                        Text(String(questionViewModel.questionModel.views))
                    }.foregroundStyle(.black)
                }
            }
        }
        
    }
}

public enum Background: Int, CaseIterable {
    case orange
    case yellow
    case indigo
    case purple
    
    var color: Color {
        switch self {
        case .orange:
            return Color(uiColor: UIColor(red: 255.0/255.0, green: 168.0/255.0, blue: 0.0/255.0, alpha: 1))
        case .yellow:
            return Color(uiColor: UIColor(red: 255.0/255.0, green: 216.0/255.0, blue: 58.0/255.0, alpha: 1))
        case .indigo:
            return Color(uiColor: UIColor(red: 209.0/255.0, green: 225.0/255.0, blue: 240.0/255.0, alpha: 1))
        case .purple:
            return Color(uiColor: UIColor(red: 224.0/255.0, green: 194.0/255.0, blue: 237.0/255.0, alpha: 1))
        }
    }
}
