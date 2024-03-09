//
//  ContentView.swift
//  MaanyaPersonalProject
//
//  Created by Maanya Mahajan on 2/24/24.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().backgroundColor = Constants.tabViewBackgroundColor
        UITabBar.appearance().unselectedItemTintColor = Constants.unselectedTabViewColor
        self.viewModel.getQuestions()
    }
    
    @ObservedObject var viewModel = QuestionsViewModel()
    @ObservedObject var user = UserViewModel()
    
    var body: some View {
        
        TabView {
            Home()
                .tabItem {
                    Label(Constants.homePageName,
                          systemImage: Constants.homePageIcon)
                }
            
            DiscussionBoardView(viewModel: viewModel)
                .tabItem {
                    Label(Constants.discussionBoardPageName,
                          systemImage: Constants.discussionBoardPageIcon)
                }
            
            IndividualDiscussionView(viewModel: viewModel,
                                 topic: Topic.Language)
                .tabItem {
                    Label(Constants.languagesPageName,
                          systemImage: Constants.languagesPageIcon)
                }
            
            IndividualDiscussionView(viewModel: viewModel,
                                 topic: Topic.Clothing)
                .tabItem {
                    Label(Constants.clothingPageName,
                          systemImage: Constants.clothingPageIcon)
                }
            
            IndividualDiscussionView(viewModel: viewModel,
                                 topic: Topic.Festivals)
                .tabItem {
                    Label(Constants.festivalsPageName,
                          systemImage: Constants.festivalsPageIcon)
                }
            
            IndividualDiscussionView(viewModel: viewModel,
                                 topic: Topic.Food)
                .tabItem {
                    Label(Constants.foodPageName,
                          systemImage: Constants.foodPageIcon)
                }
        }
        .accentColor(Color(Constants.selectedTabViewColor))
        .environmentObject(user)
    }
}

extension Constants {
    fileprivate static let homePageIcon = "house.fill"
    fileprivate static let discussionBoardPageIcon = "bubble.left.and.bubble.right.fill"
    fileprivate static let languagesPageIcon = "globe"
    fileprivate static let clothingPageIcon = "tshirt.fill"
    fileprivate static let festivalsPageIcon = "sun.horizon.fill"
    fileprivate static let foodPageIcon = "fork.knife.circle.fill"
    
    fileprivate static let tabViewBackgroundColor = UIColor(red: 48.0/255.0,
                                                            green: 120.0/255.0,
                                                            blue: 187.0/255.0,
                                                            alpha: 1)
    
    fileprivate static let selectedTabViewColor = UIColor(red: 226.0/255.0,
                                                          green: 99.0/255.0,
                                                          blue: 45/255.0,
                                                          alpha: 1)
    
    fileprivate static let unselectedTabViewColor = UIColor.black
}
