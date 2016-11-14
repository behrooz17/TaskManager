//
//  ViewController.swift
//  TaskManager
//
//  Created by Behrooz Amuyan on 11/11/16.
//  Copyright © 2016 Behrooz. All rights reserved.
//  references : https://code.tutsplus.com/tutorials/ios-from-scratch-with-swift-table-view-basics--cms-25160
//               https://www.lynda.com/Swift-tutorials/Create-custom-table-view-cell/518766/551541-4.html?autoplay=true

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    
    // Create a dictionary to list the section sheaders and rows.
    // Tasks is derived from Task.swift
    var allTask : [String: [Tasks]]  = [
        "To Do"    : [Tasks.init(name: "Do Laundry", date: "today", complete: true) ,
                     Tasks.init(name: "Learn Swift", date: "next Monday", complete: true),
                     Tasks.init(name: "Run", date: "tomorrow", complete: false),
                     Tasks.init(name: "Call phone", date: "tomorrow", complete: false)],
        "Supplies" : [Tasks.init(name: "Printer Ink", date: "Friday", complete: false) ],
        "Calls"    : [Tasks.init(name: "Customer Service", date: "Monday", complete: false)]
    ]

    // Create of the number of section based on the key count of allTask.
    func numberOfSections(in tableView: UITableView) -> Int {
        let keys = allTask.keys
        return keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        // Capture the kyes of allTask.
        let tasksForKeys = allTask.keys
         print("\(tasksForKeys)")
        
        // Sort the keys of the dictionary.
        //Q: if I don't sort the keys I get an erroor : "LazyMapCollection<Dictionary"
         let sortedSections = tasksForKeys.sorted(by: { (a,b) -> Bool in
            a.lowercased() < b.lowercased() })
        print("\(sortedSections)")
        
       let key = sortedSections[section]
       return allTask[key]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath) as! TaskTableViewCell
        
        // Sort the keys of the dictionary.
        let sortedSections = allTask.keys.sorted(by: { (a,b) -> Bool in
            a.lowercased() < b.lowercased() })
        
        // Capture the elements of values of the dictionary
        let key = sortedSections[indexPath.section]
        let task = allTask[key]?[indexPath.row]
        
        //Assigning the values of the dictionary to the componants of the cell.
        cell.taskName.text = task?.name
        cell.taskDate.text = task?.date
        cell.taskSwitch.isOn = (task?.complete)!
        
        return cell
    }
    
    // populating the headers that come form the keys of the dictionary.
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let keys = allTask.keys.sorted(by: { (a,b) -> Bool in
            a.lowercased() < b.lowercased() })
        
        return keys[section]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

