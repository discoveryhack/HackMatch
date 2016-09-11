//
//  HackMapper.swift
//  HackMatch
//
//  Created by Ankit Jasuja on 9/11/16.
//  Copyright © 2016 iOS Group 5. All rights reserved.
//

import UIKit

class HackMapper: NSObject {

    func toHackDO(hack : Hack) -> HackDO {
        let hackDO = HackDO()
        hackDO.objectId = hack.hackId
        hackDO["hackName"] = hack.hackName
        return hackDO
    }

    func toHack(hackDO : HackDO) -> Hack {
        let hack = Hack()
        hack.hackId = hackDO.objectId
        hack.hackName = hackDO.hackName
        return hack
    }

}
