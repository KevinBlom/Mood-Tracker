//
//  EnterableMoodRow.swift
//  MoodTracker
//
//  Created by Kevin Blom on 20/07/2019.
//  Copyright © 2019 Atomische Droeftoeters. All rights reserved.
//

import SwiftUI

struct EnterableMoodRow: View {
    var moodName: String
    var backgroundColor: Color
    
    var body: some View {
        VStack (alignment: .leading){
            Text(moodName)
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.white)
        }.padding()
            .frame(width: .cellWidth, height: .cellHeight, alignment: .leading)
            .background(backgroundColor.cornerRadius(.cellRadius))
    }
}
