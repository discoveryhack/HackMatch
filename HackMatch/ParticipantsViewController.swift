//
//  ParticipantsViewController.swift
//  HackMatch
//
//  Created by Ankit Jasuja on 9/10/16.
//  Copyright © 2016 iOS Group 5. All rights reserved.
//

import UIKit

class ParticipantsViewController: UIViewController {

    @IBOutlet weak var participantsTableView: UITableView!
    
    var hack : Hack?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        participantsTableView.dataSource = self
        participantsTableView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        participantsTableView.contentInset.top = topLayoutGuide.length
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func refresh() {
        self.participantsTableView.reloadData()
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

extension ParticipantsViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hack?.participants?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let participantCell = tableView.dequeueReusableCellWithIdentifier(Constants.PARTICIPANT_CELL) as! ParticipantCell
        let participant = self.hack?.participants![indexPath.row]
        populateCell(participantCell, participant: participant!)
        return participantCell
    }
    
    private func populateCell(participantCell : ParticipantCell, participant : User) {
        participantCell.participant = participant
        
        participantCell.participantNameLabel.text = participant.userName
    }

}
