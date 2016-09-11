//
//  HackUserManager.swift
//  HackMatch
//
//  Created by Ankit Jasuja on 9/11/16.
//  Copyright © 2016 iOS Group 5. All rights reserved.
//

import UIKit
import Parse

class HackUserManager: NSObject {
    

    let hackUserDao = ParseDAO(className: Constants.HACK_USER_RELATION_CLASSNAME)
    let hackMapper = HackMapper()
    let userMapper = UserMapper()
    
    
    func getAllParticipantsByHackId(hackId : String, completion : ([User], NSError?) -> Void) {
        var participants : [User] = []
        let parseContext = ParseContext(className: Constants.HACK_USER_RELATION_CLASSNAME)
        parseContext.className = Constants.HACK_USER_RELATION_CLASSNAME
        parseContext.predicateFormat = "hack IN %@"
        parseContext.innerClassName = Constants.HACK_CLASSNAME
        parseContext.innerPredicateFormat = "objectId = '\(hackId)'"
        parseContext.includeKeyParams = ["user"]
        hackUserDao.getAllByForeignKey(parseContext) { (hackUserPfObjects : [PFObject]?, error : NSError?) in
            if error == nil {
                if let hackUserPfObjects = hackUserPfObjects {
                    for hackUserPfObject in hackUserPfObjects {
                        let hackUserRelationDO = hackUserPfObject as! HackUserRelationDO
                        participants.append(self.userMapper.toUser(hackUserRelationDO.user!))
                    }
                }
            }
            completion(participants, error)
        }
    }

}
