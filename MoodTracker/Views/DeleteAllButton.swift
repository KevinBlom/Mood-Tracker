//
//  DeleteAllButton.swift
//  MoodTracker
//
//  Created by Kevin Blom on 30/11/2019.
//  Copyright © 2019 Atomische Droeftoeters. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData

struct DeleteAllButton: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @State private var showingAlert = false
    
    var body: some View {
        Button(action: {
            self.showingAlert = true
        }) {
            Text("Delete all data").frame(height: 30).padding(.trailing)
        }.alert(isPresented:$showingAlert) {
            Alert(title: Text("Are you sure you want to delete all tracked moods?"),
                  message: Text("Deleted data can not be recovered."),
                  primaryButton: .destructive(Text("Delete")) {
                    let daySummaryfetchRequest: NSFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "DaySummaryEntity")
                    let daySummarybatchDeleteRequest = NSBatchDeleteRequest(fetchRequest: daySummaryfetchRequest)
                    do {
                        try self.managedObjectContext.executeAndMergeChanges(using: daySummarybatchDeleteRequest)
                    } catch let error {
                        print(error)
                    }
                    
                    let fetchRequest: NSFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MoodEntity")
                    let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
                    do {
                        try self.managedObjectContext.executeAndMergeChanges(using: batchDeleteRequest)
                    } catch let error {
                        print(error)
                    }
                  },
                  secondaryButton: .cancel())
        }
    }
}
