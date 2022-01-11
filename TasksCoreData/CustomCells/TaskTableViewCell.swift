//
//  TaskTableViewCell.swift
//  TasksCoreData
//
//  Created by Justin Lowry on 12/22/21.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    var task: Task? {
        didSet {
            
        }
    }
    
    // MARK: - Outlets
    @IBOutlet weak var taskNameLabel: UIView!
    
    @IBOutlet weak var completionButton: UIButton!
    
    @IBOutlet weak var completionButtonTapped: UIButton!
    
    
    

}
