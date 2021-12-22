//
//  TaskController.swift
//  TasksCoreData
//
//  Created by Justin Lowry on 12/21/21.
//

import Foundation
import CoreData

class TaskController {
    static let shared = TaskController()
    private init() {}
    
    var tasks: [Task] = []
    private lazy var fetchRequest: NSFetchRequest<Task> = {
        let request = NSFetchRequest<Task>(entityName: "Task")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    
    // CRUD
    // Create
    func createTaskWith(name: String, notes: String?, dueDate: Date?) {
        Task(name: name, notes: notes, isComplete: false)
        CoreDataStack.saveContext()
    }
    
    // Read/Fetch
    func fetchTasks() {
        let tasks = try? CoreDataStack.context.fetch(self.fetchRequest)
        guard let tasks = tasks else { return }
            self.tasks = tasks
        CoreDataStack.saveContext()
    }
    
    
    // Update
    func update(task: Task, name: String, notes: String?, dueDate: Date?) {
        guard let index = tasks.firstIndex(of: task) else { return }
        let taskToUpdate = tasks[index]
        taskToUpdate.name = name
        taskToUpdate.notes = notes
        taskToUpdate.dueDate = dueDate
        CoreDataStack.saveContext()
    }
    
    private func toggleIsComplete(task: Task) {
        if task.isComplete {
            task.isComplete = !task.isComplete
        } else {
            task.isComplete = task.isComplete
        }
        CoreDataStack.saveContext()
    }
    
}
