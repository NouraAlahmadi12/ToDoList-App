//
//  AddTaskVC.swift
//  Task
//
//  Created by Noura Alahmadi on 26/03/1443 AH.
//

import UIKit

class AddTaskVC: UIViewController {
    var taskToDo = List()
    var selecteCell : Int!
    /* TextField */
    @IBOutlet weak var EnterTask: UITextField!
    @IBOutlet weak var EnterDetails: UITextField!
    @IBOutlet weak var EnterDate: UITextField!
    @IBOutlet weak var EnterTime: UITextField!
    @IBOutlet weak var EnterPriorty: UITextField!
    
    /* button OutLet */
    @IBOutlet weak var saveButtonLet: UIButton!
    @IBOutlet weak var updateButtonLet: UIButton!
    
    /* UILabel */
    @IBOutlet weak var Addlabel: UILabel!
    @IBOutlet weak var updateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateButtonLet.isHidden = true
        updateLabel.isHidden = true
        
        if(selecteCell != nil){
            
            EnterTask.text = taskToDo.tasks[selecteCell].taskTitle
            EnterDetails.text = taskToDo.tasks[selecteCell].taskDetails
            EnterDate.text = taskToDo.tasks[selecteCell].taskDate
            EnterTime.text = taskToDo.tasks[selecteCell].taskTime
            EnterPriorty.text = taskToDo.tasks[selecteCell].taskPriorty
            updateButtonLet.isHidden = false
            updateLabel.isHidden = false
            saveButtonLet.isHidden = true
            Addlabel.isHidden = true
        }
    }
    
    /* button for the save new Task */
    
    @IBAction func saveButton(_ sender: Any) {
        if (EnterTask.text!.isEmpty || EnterDetails.text!.isEmpty || EnterTime.text!.isEmpty || EnterDate.text!.isEmpty || EnterPriorty.text!.isEmpty){
            showErrorAlert("cannot Be empty")
            return
        }
        taskToDo.tasks.append(Task(taskTitle: EnterTask.text!, taskDetails: EnterDetails.text!, taskTime: EnterTime.text!, taskDate: EnterDate.text!, taskPriorty: EnterPriorty.text!))
        self.navigationController?.popViewController(animated: true)
        
    }
    @IBAction func updateButton(_ sender: Any) {
        if (EnterTask.text!.isEmpty || EnterDetails.text!.isEmpty || EnterTime.text!.isEmpty || EnterDate.text!.isEmpty || EnterPriorty.text!.isEmpty){
            showErrorAlert("cannot Be empty")
            return
        }
        
        taskToDo.tasks[selecteCell] = Task(taskTitle: EnterTask.text!, taskDetails: EnterDetails.text!, taskTime: EnterTime.text!, taskDate: EnterDate.text!, taskPriorty: EnterPriorty.text!)
        self.navigationController?.popViewController(animated: true)
    
    }
    
    /* show an error */
    func showErrorAlert(_ errorMessage: String) {
        let alertError = UIAlertController(title: "Failed", message: errorMessage, preferredStyle: .alert)
        alertError.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
        self.present(alertError, animated: true, completion: nil)
    }
}
