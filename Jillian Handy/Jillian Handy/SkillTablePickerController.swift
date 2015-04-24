//
//  SkillTablePickerController.swift
//  Jillian Handy
//
//  Created by Munson, Jillian on 4/19/15.
//
//

import Foundation
import UIKit

struct Skill {
    let displayName: String;
    let description: String;
    let logoPath: String;
}

class SkillTablePickerController: UITableViewController {
    
    private let skillCellIdentifier = "skillCell"
    
    var collapseDetailViewController: Bool  = true
    
    private let skills = [
        Skill(displayName: "java", description: "List of things I've done with Java", logoPath: "java"),
        Skill(displayName: "javascript", description: "List of things I've done with javascript",logoPath: "js"),
        Skill(displayName: "python",description: "List of python experience",logoPath: "java"),
        Skill(displayName: "stylus", description: "List of stylus projects",logoPath: "stylus")
    ]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
            // colorViewController should never be assigned to nil !!!
            var skillViewController: SkillViewController!
        
            // this is common part, where one can configure detail view
            // segue provides a new instance of detail view everytime
            if let selectedRowIndexPath = tableView.indexPathForSelectedRow() {
                let skill = skills [selectedRowIndexPath.row]
                skillViewController.title = skill.displayName
                skillViewController.logoView.image = (UIImage(named: skill.logoPath))
                skillViewController.skillDescription.text = skill.description
            }
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return skills.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(skillCellIdentifier) as UITableViewCell
        
        let skill = skills[indexPath.row]
        cell.textLabel?.text = skill.displayName
        
        return cell
    }
    
    // MARK: Table View Delegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        collapseDetailViewController = false
    }
    
}