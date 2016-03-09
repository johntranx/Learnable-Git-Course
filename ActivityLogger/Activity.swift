//
//  Activity.swift
//  ActivityLogger
//
//  Created by Nam Tran on 3/9/16.
//  Copyright © 2016 Nam Tran. All rights reserved.
//

import UIKit

class Activity: NSObject {
    var activityName:String = ""
    var totalTime:Int = 0
    
    override init() {
        
    }
    
    init(activityName:String, totalTime:Int) {
        self.activityName = activityName
        self.totalTime = totalTime
    }
}
