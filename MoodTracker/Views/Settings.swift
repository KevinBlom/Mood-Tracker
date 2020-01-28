//
//  Settings.swift
//  MoodTracker
//
//  Created by Kevin Blom on 07/01/2020.
//  Copyright © 2020 Atomische Droeftoeters. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

struct Settings: View {

    var body: some View {
        List {
            DeleteAllButton()
        }.navigationBarTitle("Settings")
    }
}
