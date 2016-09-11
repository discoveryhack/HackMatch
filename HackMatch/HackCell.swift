//
//  HackCell.swift
//  HackMatch
//
//  Created by Ankit Jasuja on 9/10/16.
//  Copyright © 2016 iOS Group 5. All rights reserved.
//

import UIKit

class HackCell: UITableViewCell {

    @IBOutlet weak var hackNameLabel: UILabel!
    
    var hack : Hack?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.accessoryType = .DisclosureIndicator
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
