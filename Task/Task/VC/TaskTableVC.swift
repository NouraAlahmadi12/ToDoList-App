//
//  TaskTableVC.swift
//  Task
//
//  Created by Noura Alahmadi on 26/03/1443 AH.
//

import UIKit


class TaskTableVC: UITableViewController {
    var taskToDo = List()
    var selectedTask : Task!
    var selectedCell : Int!
    
    @IBOutlet var TaskTable: UITableView!
    
    @IBAction func DeletAll(_ sender: Any) {
        taskToDo.tasks.removeAll()
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "TaskCell", bundle: nil), forCellReuseIdentifier: "TaskCellID")
        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        tableView.rowHeight = 95
    }
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return taskToDo.tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCellID", for: indexPath) as! TaskCell
        cell.taskName?.text = taskToDo.tasks[indexPath.row].taskTitle
        cell.taskDetails?.text = taskToDo.tasks[indexPath.row].taskDetails
        cell.taskDate?.text = taskToDo.tasks[indexPath.row].taskDate
        cell.taskTime?.text = taskToDo.tasks[indexPath.row].taskTime
        cell.taskPriorty?.text = taskToDo.tasks[indexPath.row].taskPriorty
        return cell
    }
    

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            taskToDo.tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        tableView.reloadData()
//        UserDefaults.standard.set(taskToDo , forKey: "taskToDo")
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCell = indexPath.row
       performSegue(withIdentifier: "editeID", sender: self)
    }
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "AddID"){
            let addTaskVC = segue.destination as! AddTaskVC
                addTaskVC.taskToDo = taskToDo
        }
        else if (segue.identifier == "editeID"){
        let addTaskVC = segue.destination as! AddTaskVC
            addTaskVC.taskToDo = taskToDo
            addTaskVC.selecteCell = selectedCell
        }
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}
