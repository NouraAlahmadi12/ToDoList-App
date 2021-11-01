//
//  TaskCell.swift
//  Task
//
//  Created by Noura Alahmadi on 26/03/1443 AH.
//

import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet weak var taskName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
