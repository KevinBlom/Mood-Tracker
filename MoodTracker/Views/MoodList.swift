//
//  MoodList.swift
//  MoodTracker
//
//  Created by Kevin Blom on 30/11/2019.
//  Copyright © 2019 Atomische Droeftoeters. All rights reserved.
//

import Foundation
import CoreData
import SwiftUI

struct MoodList: View {

    @FetchRequest(fetchRequest: DaySummaryEntity.getAllSummaries()) var daySummaries: FetchedResults<DaySummaryEntity>
    
    var body: some View {
        ForEach(self.daySummaries) {
            summary in
            MoodRow(summary: summary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity , alignment: .top)
    }
}
