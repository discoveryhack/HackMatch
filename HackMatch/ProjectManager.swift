//
//  ProjectManager.swift
//  HackMatch
//
//  Created by Ankit Jasuja on 9/11/16.
//  Copyright © 2016 iOS Group 5. All rights reserved.
//

import UIKit
import Parse

class ProjectManager: NSObject {

    let projectDao = ParseDAO(className: Constants.PROJECT_CLASSNAME)
    let projectMapper = ProjectMapper()
    
    func getAllProjectsByHackId(hackId : String, completion : ([Project], NSError?) -> Void) {
        var projects : [Project] = []
        let parseContext = ParseContext(className: Constants.PROJECT_CLASSNAME)
        parseContext.className = Constants.PROJECT_CLASSNAME
        parseContext.predicateFormat = "hack IN %@"
        parseContext.innerClassName = Constants.HACK_CLASSNAME
        parseContext.innerPredicateFormat = "objectId = '\(hackId)'"
        projectDao.getAllByForeignKey(parseContext) { (projectPfObjects : [PFObject]?, error : NSError?) in
            if error == nil {
                if let projectPfObjects = projectPfObjects {
                    for projectPfObject in projectPfObjects {
                        projects.append(self.projectMapper.toProject(projectPfObject as! ProjectDO))
                    }
                }
            }
            completion(projects, error)
        }
    }

}
