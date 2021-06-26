//
//  MoodRow.swift
//  MoodTracker
//
//  Created by Kevin Blom on 07/07/2019.
//  Copyright © 2019 Atomische Droeftoeters. All rights reserved.
//

import SwiftUI

struct MoodRow : View  {
    
    var summary: DaySummaryEntity
    var color:Color = .okay // Let's assume every day is at least 'okay'
    var moods: EnterableMoods = EnterableMoods()

    var body: some View {
        VStack (alignment: .leading){
            Text(moods.moodNameForId(id: summary.averageMood))
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.white)
            Text(summary.date.asString(style: .long))
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            Text("\(summary.numberOfMoods) entries")
                .font(.caption)
                .fontWeight(.regular)
                .foregroundColor(.white)
            //.padding(1)
        }
        .padding(.horizontal, 22)
        .frame(minWidth: .cellWidth, minHeight: .cellHeight, alignment: .leading)
        .background(Color.forId(id: summary.averageMood).cornerRadius(.cellRadius))
        .shadow(color: Color.forId(id: summary.averageMood).opacity(0.2), radius: 5, x: 0, y: 2)
        .shadow(color: Color.forId(id: summary.averageMood).opacity(0.3), radius: 20, x: 0, y: 10)
        .padding(.vertical, 10)
    }
}
