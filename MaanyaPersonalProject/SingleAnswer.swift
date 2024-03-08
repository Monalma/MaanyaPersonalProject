//
//  SingleAnswer.swift
//  MaanyaPersonalProject
//
//  Created by Monal Mahajan on 3/4/24.
//

import Foundation
import SwiftUI

public struct SingleAnswer: View {
    private let backgroundColor: Background
    @ObservedObject var answerViewModel: AnswerViewModel
    
    init(backgroundColor: Background,
         answerViewModel: AnswerViewModel) {
        self.backgroundColor = backgroundColor
        self.answerViewModel = answerViewModel
    }
    
    public var body: some View {
        ZStack {
            backgroundColor.color.ignoresSafeArea()
            VStack {
                HStack(alignment: .center) {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 50,height: 50)
                    VStack(alignment: .leading) {
                        Text("Username")
                            .font(.system(size: 14.0))
                        Text(answerViewModel.answerModel.text)
                        .background(.white)
                        .font(.system(size: 20.0))
                    }
                }
                
                HStack {
                    Button {
                        answerViewModel.upvote()
                    } label: {
                        Image(systemName: "arrowshape.up.fill")
                            .tint(Color.red)
                    }
                    Text(String(answerViewModel.answerModel.upvotes))
                        .font(.system(size: 14.0))
                    Button {
                        answerViewModel.downVote()
                    } label: {
                        Image(systemName: "arrowshape.down.fill")
                            .tint(Color.black)
                    }
                }
            }
        }
    }
}
