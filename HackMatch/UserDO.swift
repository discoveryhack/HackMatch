//
//  UserDO.swift
//  HackMatch
//
//  Created by Ankit Jasuja on 9/10/16.
//  Copyright © 2016 iOS Group 5. All rights reserved.
//

import UIKit
import Parse

class UserDO: PFObject, PFSubclassing {

    @NSManaged var userName : String?
    @NSManaged var userPassword : String?
    @NSManaged var userMetaText : String?
    @NSManaged var project : ProjectDO?
    
    static func parseClassName() -> String {
        return Constants.USER_CLASSNAME
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
