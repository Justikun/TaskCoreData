//
//  Task+convenience.swift
//  TasksCoreData
//
//  Created by Justin Lowry on 12/21/21.
//

import CoreData

extension Task {
    @discardableResult convenience init(name: String, notes: String? = nil, dueDate: Date? = nil, isComplete: Bool, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
        self.notes = notes
        self.dueDate = dueDate
        self.isComplete = isComplete
    }
}
