//
//  Enums.swift
//  TaskManagementApp
//
//  Created by vaishnavi Acharekar on 29/01/24.
//

import Foundation
import SwiftUI

enum fontNames : String{
    case bold = "Montserrat-Bold"
    case extraBold = "Montserrat-ExtraBold"
    case regular = "Montserrat-Regular"
    case medium = "Montserrat-Medium"
    case semiBold = "Montserrat-SemiBold"
    
}

enum themeColor {
    case black
    case pink
    case skyBlue
    case blue
    case brown
    case red
    case purple
    
    var colorString : Color{
        switch self {
        case .black:
            return Color.blackLabel
        case .pink:
            return Color.pinkLabel
        case .skyBlue:
            return Color.skyBlueLabel
        case .blue:
            return Color.blueLabel
        case .brown:
            return Color.brownLabel
        case .red:
            return Color.redLabel
        case .purple:
            return Color.purpleLabel
        }
    }
    
}
