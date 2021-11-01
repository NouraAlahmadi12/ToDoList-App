//
//  AddTaskVC.swift
//  Task
//
//  Created by Noura Alahmadi on 26/03/1443 AH.
//

import UIKit

class AddTaskVC: UIViewController {
    var taskToDo : List!
    /* TextField */
    @IBOutlet weak var EnterTask: UITextField!
    @IBOutlet weak var EnterDetails: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /* button for the save new Task */
    
    @IBAction func saveButton(_ sender: Any) {
        if (EnterTask.text!.isEmpty && EnterDetails.text!.isEmpty){
            showErrorAlert("cann't Be empty")
            /* */
            guard let task = taskToDo else{
                return showErrorAlert("Cannot access List")
            }
            let newTask = task.addTask(newTask: Task(taskTitle: EnterTask.text!, taskDetails: EnterDetails.text!))
            print("Added new Task \(newTask) 📥")
        }else{showErrorAlert("cannot be empty")}
    }
    /* show an error */
    func showErrorAlert(_ errorMessage: String) {
        let alertError = UIAlertController(title: "Failed", message: errorMessage, preferredStyle: .alert)
        alertError.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
        self.present(alertError, animated: true, completion: nil)
    }
}
