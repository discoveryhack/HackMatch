//
//  ProjectsViewController.swift
//  HackMatch
//
//  Created by Ankit Jasuja on 9/10/16.
//  Copyright © 2016 iOS Group 5. All rights reserved.
//

import UIKit

class ProjectsViewController: UIViewController {
    
    @IBOutlet weak var projectsTableView: UITableView!
    
    var hack : Hack?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        projectsTableView.dataSource = self
        projectsTableView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        projectsTableView.contentInset.top = topLayoutGuide.length
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func refresh() {
        self.projectsTableView.reloadData()
    }

}

extension ProjectsViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hack?.projects?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let projectCell = tableView.dequeueReusableCellWithIdentifier(Constants.PROJECT_CELL) as! ProjectCell
        let project = self.hack?.projects![indexPath.row]
        populateCell(projectCell, project: project!)
        return projectCell
    }
    
    private func populateCell(projectCell : ProjectCell, project : Project) {
        projectCell.project = project
        
        projectCell.projectNameLabel.text = project.projectName
    }
}
