//
//  PerformanceViewController.swift
//  ActivityLogger
//
//  Created by Nam Tran on 3/9/16.
//  Copyright © 2016 Nam Tran. All rights reserved.
//

import UIKit

class PerformanceViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let act2 = Activity(activityName: "Swimming", totalTime: 0)
        let act3 = Activity(activityName: "Jogging", totalTime: 0)
        ActivityManager.activities.append(act2)
        ActivityManager.activities.append(act3)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ActivityManager.activities.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "test")
        if indexPath.row <= ActivityManager.activities.count{
            cell.textLabel?.text = "\(ActivityManager.activities[indexPath.item].activityName) \(ActivityManager.activities[indexPath.item].totalTime)"
        }
        
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        if ActivityManager.activities.count > 1
        {
            return true
        }
        return false
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete
        {
        ActivityManager.activities.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
            
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

