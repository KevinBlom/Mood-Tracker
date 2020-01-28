//
//  DragIndicator.swift
//  MoodTracker
//
//  Created by Kevin Blom on 07/01/2020.
//  Copyright © 2020 Atomische Droeftoeters. All rights reserved.
//

import Foundation
import SwiftUI

struct DragIndicator: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10.0)
            .frame(width: 20, height: 5, alignment: .center)
            .foregroundColor(Color.gray)
            .padding(.top, 8)
    }
}
