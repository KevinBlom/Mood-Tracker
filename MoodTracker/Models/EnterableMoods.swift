//
//  Mood.swift
//  MoodTracker
//
//  Created by Kevin Blom on 07/07/2019.
//  Copyright © 2019 Atomische Droeftoeters. All rights reserved.
//

import SwiftUI

struct EnterableMood: Hashable, Codable, Identifiable {
    var id: Int32
    var moodName: String
}

class EnterableMoods {
    var veryGood: EnterableMood = EnterableMood(id: 1, moodName: "Very good")
    var good: EnterableMood = EnterableMood(id: 2, moodName: "Good")
    var okay: EnterableMood = EnterableMood(id: 3, moodName: "Okay")
    var bad: EnterableMood = EnterableMood(id: 4, moodName: "Bad")
    var veryBad: EnterableMood = EnterableMood(id: 5, moodName: "Very bad")
    var noMood: EnterableMood = EnterableMood(id: 0, moodName: "No mood")
    
    var list:[EnterableMood]
    
    init() {
        list = [veryGood, good, okay, bad, veryBad]
    }
    
    func moodNameForId(id: Int32) -> String {
        switch id {
        case 1:
            return veryGood.moodName
        case 2:
            return good.moodName
        case 3:
            return okay.moodName
        case 4:
            return bad.moodName
        case 5:
            return veryBad.moodName
        default:
            return noMood.moodName
        }
    }
}
