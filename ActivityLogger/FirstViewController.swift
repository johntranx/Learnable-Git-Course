//
//  FirstViewController.swift
//  ActivityLogger
//
//  Created by Nam Tran on 3/9/16.
//  Copyright © 2016 Nam Tran. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var timer:NSTimer = NSTimer()
    
    var timerCounter:Int = 0
    var currentActivity:Activity?
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBAction func startTimer_click(sender: AnyObject) {
        if startButton.titleLabel?.text == "Start"
        {
            startButton.setTitle("Stop", forState: UIControlState.Normal)
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "processTimer", userInfo: nil, repeats: true)
            
        }
        else
        {
            startButton.setTitle("Start", forState: UIControlState.Normal)
            timer.invalidate()
            currentActivity?.totalTime += timerCounter
        }
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        pickerView.reloadAllComponents()
        if ActivityManager.activities.count == 1
        {
            currentActivity = ActivityManager.activities[0]
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ActivityManager.activities.append(Activity(activityName: "Running", totalTime: 0))
        print("Add")
        print("Commit")
        print("Pushing")
        print("Avoid reject push request")
        print("write down from git hub")
        print("Add more row")

    }

    func processTimer()
    {
        timerCounter++
        timerLabel.text = String(timerCounter)
    }
    
    //delegate
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentActivity = ActivityManager.activities[row]
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let activity = ActivityManager.activities[row] 
        return activity.activityName
    }
    
    //datasource
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ActivityManager.activities.count
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

