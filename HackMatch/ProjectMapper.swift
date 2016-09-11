//
//  ProjectMapper.swift
//  HackMatch
//
//  Created by Ankit Jasuja on 9/11/16.
//  Copyright © 2016 iOS Group 5. All rights reserved.
//

import UIKit

class ProjectMapper: NSObject {

    func toProjectDO(project : Project) -> ProjectDO {
        let projectDO = ProjectDO()
        projectDO.objectId = project.projectId
        projectDO["projectName"] = project.projectName
        return projectDO
    }
    
    func toProject(projectDO : ProjectDO) -> Project {
        let project = Project()
        project.projectId = projectDO.objectId
        project.projectName = projectDO.projectName
        return project
    }
}
