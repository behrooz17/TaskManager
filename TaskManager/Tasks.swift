//
//  Tasks.swift
//  TaskManager
//
//  Created by Behrooz Amuyan on 11/11/16.
//  Copyright © 2016 Behrooz. All rights reserved.
//

import Foundation

class Tasks {
    var name: String
    var date: String
    var complete :Bool
    
    init(name:String, date:String, complete:Bool) {
        self.name = name
        self.date = date
        self.complete = complete
    }
}
