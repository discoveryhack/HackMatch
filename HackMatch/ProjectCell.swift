//
//  ProjectCell.swift
//  HackMatch
//
//  Created by Ankit Jasuja on 9/11/16.
//  Copyright © 2016 iOS Group 5. All rights reserved.
//

import UIKit

class ProjectCell: UITableViewCell {

    @IBOutlet weak var projectNameLabel: UILabel!
    var project : Project?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
