//
//  Home.swift
//  MaanyaPersonalProject
//
//  Created by Monal Mahajan on 2/24/24.
//

import SwiftUI

public struct Home: View {
    public var body: some View {
        ZStack {
            Constants.homePageBackground.ignoresSafeArea()
            
            VStack {
                Text(Constants.titleText)
                    .font(.system(size: Constants.titleTextSize,
                                  weight: .bold))
                    .multilineTextAlignment(.center)
                
                Spacer()
                HStack {
                    Constants.homePageGlobeBackground.frame(width: 190,
                                                            height: 200).padding(.bottom, Constants.imageDifferentialSize)
                    
                    Constants.homePageHeartGlobeBackground.frame(width: 190,
                                                                 height: 200).padding(.top, Constants.imageDifferentialSize)
                }
                Spacer()
                
                Divider().background(Constants.dividerColor).frame(width: Constants.dividerWidth)
                Text(Constants.descriptionText)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Divider().background(Constants.dividerColor).frame(width: Constants.dividerWidth)
                    .padding(.bottom)
            }
        }
    }
}


extension Constants {
    fileprivate static let titleTextSize:CGFloat = 36
    fileprivate static let imageDifferentialSize:CGFloat = 80.0
    
    fileprivate static let titleText = "Welcome to IB Cultural Exchange! "
    fileprivate static let descriptionText = "Culture is an important part of every student’s life, especially in an IB background where there are a variety of different cultures. Thus, this space is dedicated to fostering a deeper understanding and appreciation of these diverse cultures among students.  Together, we can celebrate our differences and cultivate a more culturally aware and harmonious environment."
    
    fileprivate static let homePageBackground = Image("HomePageBackground").resizable()
    fileprivate static let homePageGlobeBackground = Image("HomePageGlobe").resizable()
    fileprivate static let homePageHeartGlobeBackground = Image("HomePageHeartGlobe").resizable()
    
    fileprivate static let dividerWidth:CGFloat = 350
    fileprivate static let dividerColor = Color.blue
}

#Preview {
    Home()
}
