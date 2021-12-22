//
//  taskDetailViewController.swift
//  TasksCoreData
//
//  Created by Justin Lowry on 12/21/21.
//

import UIKit

class TaskDetailViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskNotesTextView: UITextView!
    @IBOutlet weak var taskDueDatePicker: UIDatePicker!
    
    var task: Task?
    var date: Date?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    
    
    // MARK: - Actions
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        date = taskDueDatePicker.date
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let taskName = taskNameTextField.text,
              !taskName.isEmpty else { return }
        
        let taskNotes = taskNotesTextView.text
        let taskDueDate = taskDueDatePicker.date
        
        if let task = task {
            TaskController.shared.update(task: task, name: taskName, notes: taskNotes, dueDate: taskDueDate)
        } else {
            print("Creating Task")
            TaskController.shared.createTaskWith(name: taskName, notes: taskNotes, dueDate: taskDueDate)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    func updateViews() {
        guard let task = task else { return }
        
        taskNameTextField.text = task.name
        taskNotesTextView.text = task.notes
        
        if let taskDueDate = task.dueDate {
            taskDueDatePicker.date = taskDueDate
        }

    }
}
