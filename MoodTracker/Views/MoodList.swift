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
    
    // @FetchRequest(fetchRequest: MoodEntity.getAllMoods()) var moodEntities:FetchedResults<MoodEntity>
    @FetchRequest(fetchRequest: DaySummaryEntity.getAllSummaries()) var daySummaries: FetchedResults<DaySummaryEntity>
    
    init() {
        
        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        List(self.daySummaries) {
            summary in
            HStack {
                Spacer()
                MoodRow(summary: summary)
                Spacer()
            }
        }
    }
}
