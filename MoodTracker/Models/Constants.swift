//
//  Constants.swift
//  MoodTracker
//
//  Created by Kevin Blom on 07/07/2019.
//  Copyright © 2019 Atomische Droeftoeters. All rights reserved.
//

import Foundation
import SwiftUI

extension CGFloat {
    static let cellHeight:CGFloat = 105
    static let cellWidth:CGFloat = 325
    static let cellRadius:CGFloat = 20
}

extension Color {
    
    // Mood colors
    static let veryGood:Color = Color("veryGood")
    static let good:Color = Color("good")
    static let okay:Color = Color("okay")
    static let bad:Color = Color("bad")
    static let veryBad:Color = Color("veryBad")
    
    // General colors
    static let backgroundWhite:Color = Color("background") //Color(red: 248, green: 248, blue: 248)
    static let textDarkBlue:Color = Color("textDarkBlue")
    static let sectionHeaderGray:Color = Color(red: 122, green: 122, blue: 122)
    static let navigationTitleBlue:Color = Color(red: 4, green: 46, blue: 62)
    
    static func forId(id:Int32) -> Color {
        switch id {
        case 0:
            return Color.veryGood
        case 1:
            return Color.good
        case 2:
            return Color.okay
        case 3:
            return Color.bad
        case 4:
            return Color.veryBad
        default:
            return Color.red
        }
    }
    static func forName(name: String) -> Color {
        switch name {
        case "Very good":
            return .veryGood
        case "Good":
            return .good
        case "Okay":
            return .okay
        case "Bad":
            return .bad
        case "Very bad":
            return .veryBad
        default:
            return Color.red
        }
    }
}
