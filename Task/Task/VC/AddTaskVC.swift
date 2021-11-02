//
//  AddTaskVC.swift
//  Task
//
//  Created by Noura Alahmadi on 26/03/1443 AH.
//

import UIKit

class AddTaskVC: UIViewController {
    var taskToDo = List()
    
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
            return
        }
            let newTask = taskToDo.addTask(newTask: Task(taskTitle: EnterTask.text!, taskDetails: EnterDetails.text!))
            print("Added new Task \(newTask) 📥")
        print(taskToDo.tasks)
        self.navigationController?.popViewController(animated: true)
         
    }
    /* show an error */
    func showErrorAlert(_ errorMessage: String) {
        let alertError = UIAlertController(title: "Failed", message: errorMessage, preferredStyle: .alert)
        alertError.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
        self.present(alertError, animated: true, completion: nil)
    }
}
