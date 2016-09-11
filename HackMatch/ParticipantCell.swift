//
//  ParticipantCell.swift
//  HackMatch
//
//  Created by Ankit Jasuja on 9/11/16.
//  Copyright © 2016 iOS Group 5. All rights reserved.
//

import UIKit

class ParticipantCell: UITableViewCell {

    @IBOutlet weak var participantNameLabel: UILabel!
    
    var participant : User?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
