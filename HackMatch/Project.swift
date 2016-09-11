//
//  Project.swift
//  HackMatch
//
//  Created by Ankit Jasuja on 9/10/16.
//  Copyright © 2016 iOS Group 5. All rights reserved.
//

import UIKit

class Project: NSObject {

    var projectId : String?
    var projectName : String?
    
    var skillRequired : [Skill]?
    var skillFilled : [Skill]?
    
    var rolesRequired : [Role]?
    var rolesFilled : [Role]?
    
    var membersCurrent : [User]?
}
