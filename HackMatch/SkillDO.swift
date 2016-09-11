//
//  SkillDO.swift
//  HackMatch
//
//  Created by Ankit Jasuja on 9/10/16.
//  Copyright © 2016 iOS Group 5. All rights reserved.
//

import UIKit
import Parse

class SkillDO: PFObject, PFSubclassing {

    @NSManaged var skillName : String?
    @NSManaged var user  : UserDO?
    @NSManaged var project  : ProjectDO?
    @NSManaged var filled  : String?
    
    static func parseClassName() -> String {
        return Constants.SKILL_CLASSNAME
    }
    
    override init() {
        super.init()
    }
    
    override class func initialize() {
        var onceToken: dispatch_once_t = 0
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }

}
