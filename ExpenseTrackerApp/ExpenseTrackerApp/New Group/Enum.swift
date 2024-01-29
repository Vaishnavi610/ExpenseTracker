//
//  extensionFonts.swift
//  ExpenseTrackerApp
//
//  Created by vaishnavi Acharekar on 23/01/24.
//

import Foundation



enum Fonts : String{
    case Bold = "Inter-Bold"
    case semiBold = "Inter-SemiBold"
    case regular = "Inter-Regular"
    case light = "Inter-Light"
    case medium = "Inter-Medium"
    case extraBold = "Inter-ExtraBold"
}

enum selectedTabs {
    case home
    case transactions
    case newTransactions
    case statistics
    case profile
}


enum categories{
    
    case cafe
    case food
    case movie
    case carInsuarnce
    case transport
    case house
    case game
    case entertainment
    
    var imageName : String {
        switch self {
        case .cafe:
            return "cafe"
        case .food:
            return "food"
        case .movie:
            return "movie"
        case .carInsuarnce:
            return "carInsurance"
        case .transport:
            return "cab"
        case .house:
            return "house"
        case .game:
            return "game"
        case .entertainment:
            return "entertainment"
        }
    }
    
}
