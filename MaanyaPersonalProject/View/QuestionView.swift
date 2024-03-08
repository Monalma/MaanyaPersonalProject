//
//  QuestionView.swift
//  MaanyaPersonalProject
//
//  Created by Monal Mahajan on 3/3/24.
//

import Foundation
import SwiftUI

public struct QuestionView: View {
    var questionViewModel: QuestionViewModel
    let backgroundColor: Background
    
    init(questionModel: QuestionViewModel,
         backgroundColor: Background) {
        self.questionViewModel = questionModel
        self.backgroundColor = backgroundColor
    }
    
    @State private var showingPopoverAnswers = false
    
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
                        
                        // TODO
                    } label: {
                        VStack {
                            Image(systemName: "person.crop.circle")
                            Text("Creator")
                        }.foregroundStyle(.black)
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

extension Constants {
    fileprivate static let title = "Dummy text long text dummy"
}

public enum Background: Int, CaseIterable {
    case orange
    case yellow
    case indigo
    case purple
    
    var color: Color {
        switch self {
        case .orange:
            return Color.orange
        case .yellow:
            return Color.yellow
        case .indigo:
            return Color.indigo
        case .purple:
            return Color.purple
        }
    }
}
