//
//  EnterMoodList.swift
//  MoodTracker
//
//  Created by Kevin Blom on 19/07/2019.
//  Copyright © 2019 Atomische Droeftoeters. All rights reserved.
//

import SwiftUI
import CoreData
import UIKit

struct EnterMoodList : View {
    
    @Binding var isModal: Bool
    @Environment(\.managedObjectContext) var managedObjectContext: NSManagedObjectContext
    
    @FetchRequest(fetchRequest: DaySummaryEntity.getTodaysSummary()) var todaysSummary:FetchedResults<DaySummaryEntity>
    
    
    
    var enterableMoods = EnterableMoods()
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                ForEach(self.enterableMoods.list) {
                    enterableMoodItem in
                    Button(action: {
                        
                        let date = Date()
                        
                        let mood = MoodEntity(context: self.managedObjectContext)
                        mood.id = UUID()
                        mood.date = date
                        print("Submitting moodID: \(enterableMoodItem.id)")
                        mood.moodID = Int32(enterableMoodItem.id)
                        
                        // If there is a summary, add the mood, else, create the summary.
                        if let summary = self.todaysSummary.first {
                            mood.summary = summary
                            
                            let tempAvarage: Float = Float(summary.averageMood)
                            let tempNumberOfMoods: Float = Float(summary.numberOfMoods)
                            let tempMoodID: Float = Float(mood.moodID)
                            
                            let temp = (tempAvarage * tempNumberOfMoods) + tempMoodID
                            var tempAvg = temp / (tempNumberOfMoods+1.0)
                            
                            print("tempAvg: \(tempAvg)")
                            print("Int32(tempAvg):\(Int32(tempAvg))")
                            
                            tempAvg.round()
                            print("tempAvg after rounding: \(tempAvg)")
                            // Updating the average using a weighted average from previous submissions + new submission)
                            summary.averageMood = Int32(tempAvg) //((summary.averageMood * summary.numberOfMoods) + mood.moodID) / (summary.numberOfMoods+1)
                            summary.numberOfMoods += 1
                            print("Average mood: \(summary.averageMood)")
                        } else {
                            let summary = DaySummaryEntity(context: self.managedObjectContext)
                            summary.id = UUID()
                            summary.date = Date()
                            summary.numberOfMoods += 1
                            summary.averageMood = mood.moodID
                            mood.summary = summary
                            print("Average mood: \(summary.averageMood)")
                        }
                        
                        do {
                            try self.managedObjectContext.save()
                        } catch let error {
                            print("This is the error:\(error)")
                            // handle the Core Data error
                        }
                        self.isModal.toggle()
                    }) {
                        EnterableMoodRow(moodName: enterableMoodItem.moodName, backgroundColor: Color.forId(id: enterableMoodItem.id))
                            .padding(.vertical, 7)
                    }
                }.frame(width: geometry.size.width, height: geometry.size.height)
            } .background(Color.backgroundWhite)
        }
    }
}
