//
//  HackUserRelationDO.swift
//  HackMatch
//
//  Created by Ankit Jasuja on 9/10/16.
//  Copyright © 2016 iOS Group 5. All rights reserved.
//

import UIKit
import Parse

class HackUserRelationDO: PFObject, PFSubclassing {

    @NSManaged var hack : HackDO?
    @NSManaged var user : UserDO?
    
    static func parseClassName() -> String {
        return Constants.HACK_USER_RELATION_CLASSNAME
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
