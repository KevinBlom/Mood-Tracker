//
//  NSManagedObjectContext+Extension.swift
//  MoodTracker
//
//  Created by Kevin Blom on 15/10/2019.
//  Copyright © 2019 Atomische Droeftoeters. All rights reserved.
//

import Foundation
import CoreData

// https://www.avanderlee.com/swift/nsbatchdeleterequest-core-data/

extension NSManagedObjectContext {
    // Executes the given `NSBatchDeleteRequest` and directly merges the changes to bring the given managed object context up to date.
    ///
    /// - Parameter batchDeleteRequest: The `NSBatchDeleteRequest` to execute.
    /// - Throws: An error if anything went wrong executing the batch deletion.
    public func executeAndMergeChanges(using batchDeleteRequest: NSBatchDeleteRequest) throws {
        batchDeleteRequest.resultType = .resultTypeObjectIDs
        let result = try execute(batchDeleteRequest) as? NSBatchDeleteResult
        let changes: [AnyHashable: Any] = [NSDeletedObjectsKey: result?.result as? [NSManagedObjectID] ?? []]
        NSManagedObjectContext.mergeChanges(fromRemoteContextSave: changes, into: [self])
    }
}
