//
//  SectionHeader.swift
//  MoodTracker
//
//  Created by Kevin Blom on 25/10/2019.
//  Copyright © 2019 Atomische Droeftoeters. All rights reserved.
//

import Foundation
import SwiftUI

struct SectionHeader: View {
    
    let sectionTitle: String
    
    var body: some View {
        HStack {
            Text(sectionTitle)
                .font(.headline)
                .padding(.vertical, 10)
                .padding(.leading, 25)
            Spacer()
        }.background(Color.clear)
    }
}
