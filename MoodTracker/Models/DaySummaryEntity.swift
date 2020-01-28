//
//  DaySummaryEntity.swift
//  MoodTracker
//
//  Created by Kevin Blom on 25/10/2019.
//  Copyright © 2019 Atomische Droeftoeters. All rights reserved.
//

import Foundation
import CoreData

public class DaySummaryEntity: NSManagedObject, Identifiable {
    @NSManaged public var date:Date
    @NSManaged public var id:UUID
    @NSManaged public var averageMood:Int32
    @NSManaged public var numberOfMoods:Int32
    @NSManaged public var moods: MoodEntity
}

extension DaySummaryEntity {
    
    static func getAllSummaries() -> NSFetchRequest<DaySummaryEntity> {
        let request: NSFetchRequest<DaySummaryEntity> = DaySummaryEntity.fetchRequest() as! NSFetchRequest<DaySummaryEntity>
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: false)
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
    
    static func getTodaysSummary() -> NSFetchRequest<DaySummaryEntity> {
        let today = Date() // This is now
        let calendar = NSCalendar.current
        
        // Create two dates, one for start of today, one for the end of today because we want to find the summary of today.
        let startDate = calendar.startOfDay(for: today)
        let endDate = calendar.date(byAdding: .day, value: 1, to: startDate)!
        
        // Create a predicate to filter between start of today and end of today
        let predicate = NSPredicate(format: "date >= %@ AND date < %@", startDate as NSDate, endDate as NSDate)
        
        // Request does not need a sort descriptor because (in theory) we should be only getting one summary every day.
        let request: NSFetchRequest<DaySummaryEntity> = DaySummaryEntity.fetchRequest() as! NSFetchRequest<DaySummaryEntity>
        request.sortDescriptors = []
        request.predicate = predicate
        
        return request
    }
}
