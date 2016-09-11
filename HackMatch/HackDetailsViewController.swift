//
//  HackDetailsViewController.swift
//  HackMatch
//
//  Created by Ankit Jasuja on 9/10/16.
//  Copyright © 2016 iOS Group 5. All rights reserved.
//

import UIKit

class HackDetailsViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var hackTabBarView: UIView!
    
    var projectsViewController : ProjectsViewController!
    var participantsViewController : ParticipantsViewController!

    var tabBarViewControllers : [UIViewController]!
    
    let projectManager = ProjectManager()
    let hackUserManager = HackUserManager()
    
    var hack : Hack?
    var isProjectsTabSelected : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = hack?.hackName
        fetchProjects()
        let projectStoryboard = UIStoryboard(name: Constants.PROJECT_STORYBOARD_NAME, bundle: nil)
        let userStoryboard = UIStoryboard(name: Constants.USER_STORYBOARD_NAME, bundle: nil)

        projectsViewController = projectStoryboard.instantiateViewControllerWithIdentifier(Constants.PROJECTS_VIEW_CONTROLLER_ID) as? ProjectsViewController
        participantsViewController = userStoryboard.instantiateViewControllerWithIdentifier(Constants.PARTICIPANTS_VIEW_CONTROLLER_ID) as? ParticipantsViewController
        
        tabBarViewControllers = [projectsViewController, participantsViewController]
        onProjectsTabItemTap(self)
    }

    
    
    @IBAction func onProjectsTabItemTap(sender: AnyObject) {
        isProjectsTabSelected = true
        print("projects tab selected ...")
        addChildViewController(projectsViewController)
        
        projectsViewController.hack = self.hack
        projectsViewController.view.frame = contentView.frame
        contentView.addSubview(projectsViewController.view)
        projectsViewController.didMoveToParentViewController(self)

    }
    
    
    @IBAction func onParticipantsTabItemTap(sender: AnyObject) {
        isProjectsTabSelected = false
        print("participants tab selected ...")
        addChildViewController(participantsViewController)
        
        participantsViewController.hack = self.hack
        participantsViewController.view.frame = contentView.frame
        contentView.addSubview(participantsViewController.view)
        participantsViewController.didMoveToParentViewController(self)
        fetchParticipants()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func fetchProjects() {
        projectManager.getAllProjectsByHackId((hack?.hackId)!) { (projects : [Project], error : NSError?) in
            if error == nil {
                self.hack?.projects = projects
                self.projectsViewController.refresh()
            }
        }
    }
    
    private func fetchParticipants() {
        hackUserManager.getAllParticipantsByHackId((hack?.hackId)!) { (participants : [User], error : NSError?) in
            if error == nil {
                self.hack?.participants = participants
                self.participantsViewController.refresh()
            }
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
