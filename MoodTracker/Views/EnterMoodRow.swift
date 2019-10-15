//
//  EnterMoodRow.swift
//  MoodTracker
//
//  Created by Kevin Blom on 19/07/2019.
//  Copyright © 2019 Atomische Droeftoeters. All rights reserved.
//

import SwiftUI

struct EnterMoodRow : View {
    var body: some View {
        ZStack (alignment: .center) {
            RoundedRectangle(cornerRadius: .cellRadius)
                .frame(width: .cellWidth, height: .cellHeight, alignment: .center)
                .foregroundColor(Color.clear)
            
            RoundedRectangle(cornerRadius: .cellRadius)
                .frame(width: 20, height: 2)
                .foregroundColor(Color.gray)
            RoundedRectangle(cornerRadius: .cellRadius)
                .frame(width: 2, height: 20)
                .foregroundColor(Color.gray)
        }
        .background(Color.clear)
        .overlay(
            RoundedRectangle(cornerRadius: .cellRadius)
                .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [5,5]))
                .foregroundColor(Color.black.opacity(0.1))
        )
            .padding(.vertical, 24)
    }
}

#if DEBUG
struct EnterMoodRow_Previews : PreviewProvider {
    static var previews: some View {
        EnterMoodRow()
            .previewDevice("iPhone 8")
    }
}
#endif
