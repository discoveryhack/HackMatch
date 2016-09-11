//
//  Constants.swift
//  HackMatch
//
//  Created by Ankit Jasuja on 9/10/16.
//  Copyright © 2016 iOS Group 5. All rights reserved.
//

import UIKit

class Constants {

    // ======== Parse ========
    
//    static let parseAppId : String = "parse-demo-2-app-id"
//    static let parseServer : String = "https://parse-demo-2.herokuapp.com/parse"

    static let parseAppId : String = "groupit2"
    static let parseServer : String = "https://groupit2.herokuapp.com/parse"

    
    // ======== ClassNames ========
    static let USER_CLASSNAME = "User"
    static let SKILL_CLASSNAME = "Skill"
    static let ROLE_CLASSNAME = "Role"
    static let PROJECT_CLASSNAME = "Project"
    static let HACK_CLASSNAME = "Hack"
    static let HACK_USER_RELATION_CLASSNAME = "HackUserRelation"
    
    // ======== Segue ========
    static let HACK_DETAILS_SEGUE = "HackDetailsSegue"
    static let PROJECT_DETAILS_SEGUE = "ProjectDetailsSegue"
    static let PARTICIPANT_DETAILS_SEGUE = "ParticipantDetailsSegue"
    
    // ======== Cell ========
    static let HACK_CELL = "HackCell"
    static let PROJECT_CELL = "ProjectCell"
    static let PARTICIPANT_CELL = "ParticipantCell"

    // ======== Storyboard ========
    static let PROJECT_STORYBOARD_NAME = "Project"
    static let USER_STORYBOARD_NAME = "User"

    // ======== ViewController ========
    static let PROJECTS_VIEW_CONTROLLER_ID = "ProjectsViewController"
    static let PARTICIPANTS_VIEW_CONTROLLER_ID = "ParticipantsViewController"
}
