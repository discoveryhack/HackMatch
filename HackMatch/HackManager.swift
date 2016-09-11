//
//  HackManager.swift
//  HackMatch
//
//  Created by Ankit Jasuja on 9/11/16.
//  Copyright © 2016 iOS Group 5. All rights reserved.
//

import UIKit
import Parse

class HackManager : NSObject {

    let hackDao = ParseDAO(className: Constants.HACK_CLASSNAME)
    let hackMapper = HackMapper()
    
    func upsertHack(hack : Hack, completion : (Bool, Hack, NSError?) -> ()) -> Void {
        let hackDO = self.hackMapper.toHackDO(hack)
        hackDao.upsert(hackDO) { (created : Bool, pfObject : PFObject?, error : NSError?) in
            let hack = self.hackMapper.toHack(pfObject as! HackDO)
            completion(created, hack, error)
        }
    }

    func deleteHackById(id : String, completion : (Bool, NSError?) -> Void)  {
        hackDao.deleteById(id) { (deleted : Bool, error : NSError?) in
            completion(deleted, error)
        }
    }

    func getAllHacks(completion : ([Hack], NSError?) -> Void) {
        var hacks : [Hack] = []
        
        let parseContext = ParseContext(className: Constants.HACK_CLASSNAME)
//        parseContext.includeKeyParams.append("groupOwner")
        
        hackDao.getAllWithIncludeKeys(parseContext) { (hackPfObjects : [PFObject]?, error : NSError?) in
            if error == nil {
                if let hackPfObjects = hackPfObjects {
                    for hackPfObject in hackPfObjects {
                        hacks.append(self.hackMapper.toHack(hackPfObject as! HackDO))
                    }
                }
            }
            completion(hacks, error)
        }
    }
    
    func deleteAllHacks(completion : (NSError?) -> Void) {
        hackDao.deleteAll { (error: NSError?) in
            completion(error)
        }
    }
}
