//
//  AddViewController.swift
//  ActivityLogger
//
//  Created by Nam Tran on 3/9/16.
//  Copyright © 2016 Nam Tran. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var activityLabel: UITextField!
    

    @IBAction func addActivity_click(sender: AnyObject) {
        if activityLabel.text == ""
        {
            var alert = UIAlertController(title: "Empty activity", message: "Please type in valid activity", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else
        {
            ActivityManager.activities.append(Activity(activityName: activityLabel.text!, totalTime: 0))
            activityLabel.text = ""
            activityLabel.resignFirstResponder()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

}
