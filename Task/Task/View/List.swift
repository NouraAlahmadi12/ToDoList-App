//
//  List.swift
//  Task
//
//  Created by Noura Alahmadi on 26/03/1443 AH.
//

import UIKit

struct Task{
    var taskTitle : String
    var taskDetails : String
}

class List {
    var tasks : [Task] = []
    
    func addTask (newTask : Task) -> Task {
        tasks.append(newTask)
        return newTask
    }

}
