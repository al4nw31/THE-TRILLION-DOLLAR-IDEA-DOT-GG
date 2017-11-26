//
//  ViewController.swift
//  Party
//
//  Created by Danny Nuch on 11/20/17.
//  Copyright © 2017 alan. All rights reserved.
//

import UIKit

class FirstViewController: UITableViewController {

    var eventName = ["name 1", "name 2", "name 3"]
    var eventDescription = ["event 1", "event 2", "event 3"]
    var eventDate = ["date 1", "date 2", "date 3"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationItem.title = "Your Events"
        tableView.register(Cell.self, forCellReuseIdentifier: "cellId")
        
        //
        NotificationCenter.default.addObserver(self, selector: #selector(insertCell),name: NSNotification.Name(rawValue: "insert"), object: nil)
        //
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventName.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! Cell
        cell.nameLabel.text = eventName[indexPath.row]
        cell.descriptionLabel.text = eventDescription[indexPath.row]
        cell.dateLabel.text = eventDate[indexPath.row]
        cell.FVC = self
        return cell
    }
    
    @objc func insertCell() {
        
        eventName.append("name \(eventName.count+1)")
        eventDescription.append("desc \(eventName.count)")
        eventDate.append("date \(eventName.count)")
        print("insert cell print", eventName)
        
        tableView.beginUpdates()
        let insertionIndexPath = IndexPath(row: eventName.count-1 , section: 0)
        tableView.insertRows(at: [insertionIndexPath], with: .automatic)
        tableView.endUpdates()
       
    }
    
    func deleteCell(cell: UITableViewCell) {
        if let deletionIndexPath = tableView.indexPath(for: cell) {
            eventName.remove(at: deletionIndexPath.row)
            eventDescription.remove(at: deletionIndexPath.row)
            eventDate.remove(at: deletionIndexPath.row)
            tableView.deleteRows(at: [deletionIndexPath], with: .automatic)
        }
    }
}
