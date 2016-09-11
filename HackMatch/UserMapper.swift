//
//  ParticipantMapper.swift
//  HackMatch
//
//  Created by Ankit Jasuja on 9/11/16.
//  Copyright © 2016 iOS Group 5. All rights reserved.
//

import UIKit

class UserMapper: NSObject {

    func toUserDO(user : User) -> UserDO {
        let userDO = UserDO()
        userDO.objectId = user.userId
        userDO["userName"] = user.userName
        return userDO
    }
    
    func toUser(userDO : UserDO) -> User {
        let user = User()
        user.userId = userDO.objectId
        user.userName = userDO.userName
        return user
    }
}
