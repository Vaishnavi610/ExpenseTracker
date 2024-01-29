//
//  contentData.swift
//  ExpenseTrackerApp
//
//  Created by vaishnavi Acharekar on 22/01/24.
//

import Foundation



struct onBoardingContentData : Identifiable{
    var id = UUID()
    var heading : String
    var subHeading : String
    var image : String
    
}

var contentDataSet : [onBoardingContentData] = [
    onBoardingContentData(heading: "Track Expenses", subHeading: "Effortlessly track your daily expenses easily.", image: "onBoa1"),
    onBoardingContentData(heading: "Set Budgets", subHeading: "Set budgets for different expense categories, and track them.", image: "onBo2"),
    onBoardingContentData(heading:  "Manage your spending.", subHeading:"Align your spending with 20:30:50 rule and save money easily.", image: "onBo3")
]
