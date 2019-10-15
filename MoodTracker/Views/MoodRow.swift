//
//  MoodRow.swift
//  MoodTracker
//
//  Created by Kevin Blom on 07/07/2019.
//  Copyright © 2019 Atomische Droeftoeters. All rights reserved.
//

import SwiftUI

struct MoodRow : View  {
    
    var mood: MoodEntity
    var color:Color = .okay
    var moods: EnterableMoods = EnterableMoods()

    var body: some View {
        VStack (alignment: .leading){
            Text(moods.moodNameForId(id: mood.moodID))
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.white)
            Text(mood.date.asString(style: .long))
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.white)
        }
        .padding(.horizontal, 22)
        .frame(width: .cellWidth, height: .cellHeight, alignment: .leading)
        .background(Color.forId(id: mood.moodID).cornerRadius(.cellRadius))
        .shadow(color: Color.forId(id: mood.moodID), radius: 6, x: 0, y: 0)
        .padding(.vertical, 10)
    }
}

//#if DEBUG
//struct MoodRow_Previews : PreviewProvider {
//    static var previews: some View {
//        MoodRow(mood: moodTestData[0])
//            .previewDevice("iPhone 8")
//    }
//}
//#endif
//  
