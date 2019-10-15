//
//  Date+Extension.swift
//  MoodTracker
//
//  Created by Kevin Blom on 12/10/2019.
//  Copyright © 2019 Atomische Droeftoeters. All rights reserved.
//

import Foundation


extension Date {
  func asString(style: DateFormatter.Style) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = style
    return dateFormatter.string(from: self)
  }
}
