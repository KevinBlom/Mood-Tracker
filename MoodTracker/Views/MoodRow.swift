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
    var color:Color = .okay
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
            .padding(1)
        }
        .padding(.horizontal, 22)
        .frame(minWidth: .cellWidth, minHeight: .cellHeight, alignment: .leading)
        .background(Color.forId(id: summary.averageMood).cornerRadius(.cellRadius))
        .shadow(color: Color.forId(id: summary.averageMood), radius: 6, x: 0, y: 0)
        .padding(.vertical, 10)
    }
}
