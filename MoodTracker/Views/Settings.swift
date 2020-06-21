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
import CoreData


struct Settings: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext: NSManagedObjectContext

    var body: some View {
        
        
        List {
            DeleteAllButton()
            
        }.navigationBarTitle("Settings")
            .onAppear {
                let mood = MoodEntity(context: self.managedObjectContext)
                mood.id = UUID()
                mood.date = Date()
                // print("Submitting moodID: 3")
                mood.moodID = Int32(3)
                
                let summary = DaySummaryEntity(context: self.managedObjectContext)
                summary.id = UUID()
                summary.date = Date()
                summary.numberOfMoods += 1
                summary.averageMood = mood.moodID
                mood.summary = summary
                print("On appear")
                
                do {
                    try self.managedObjectContext.save()
                } catch let error {
                    print("This is the error:\(error)")
                    // handle the Core Data error
                }
        }
    }
}
