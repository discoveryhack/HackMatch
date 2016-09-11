//
//  HacksViewController.swift
//  HackMatch
//
//  Created by Ankit Jasuja on 9/10/16.
//  Copyright © 2016 iOS Group 5. All rights reserved.
//

import UIKit

class HacksViewController: UIViewController {

    @IBOutlet weak var hacksTableView: UITableView!
    
    let hackManager = HackManager()
    
    var hacks : [Hack]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Hacks"
        hacksTableView.dataSource = self
        hacksTableView.delegate = self
        fetchHacks()
    }


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let hackDetailsViewController = segue.destinationViewController as! HackDetailsViewController
        hackDetailsViewController.hack = sender as? Hack
    }

    private func fetchHacks() {
        hackManager.getAllHacks { (hacks : [Hack], error : NSError?) in
            if error == nil {
                self.hacks = hacks
                self.hacksTableView.reloadData()
            }
        }
    }
}

extension HacksViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hacks?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let hackCell = tableView.dequeueReusableCellWithIdentifier(Constants.HACK_CELL) as! HackCell
        let hack = hacks![indexPath.row]
        populateCell(hackCell, hack: hack)
        return hackCell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let hack = hacks![indexPath.row]
        performSegueWithIdentifier(Constants.HACK_DETAILS_SEGUE, sender: hack)
    }
    
    private func populateCell(hackCell : HackCell, hack : Hack) {
        hackCell.hack = hack
        
        hackCell.hackNameLabel.text = hack.hackName
    }
}
