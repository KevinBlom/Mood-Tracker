//
//  MoodEntity.swift
//  MoodTracker
//
//  Created by Kevin Blom on 12/10/2019.
//  Copyright © 2019 Atomische Droeftoeters. All rights reserved.
//

import Foundation
import CoreData

public class MoodEntity: NSManagedObject, Identifiable {
    @NSManaged public var date:Date
    @NSManaged public var id:UUID
    @NSManaged public var moodID:Int32
    @NSManaged public var summary: DaySummaryEntity
}

extension MoodEntity {
    static func getAllMoods() -> NSFetchRequest<MoodEntity> {
        let request: NSFetchRequest<MoodEntity> = MoodEntity.fetchRequest() as! NSFetchRequest<MoodEntity>
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: false)
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
