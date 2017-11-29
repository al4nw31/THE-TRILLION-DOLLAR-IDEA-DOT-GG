//
//  ViewController.swift
//  Party
//
//  Created by Danny Nuch on 11/20/17.
//  Copyright © 2017 alan. All rights reserved.
//

import UIKit

class FirstViewController: UITableViewController {
    
    var db = Database()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationItem.title = "Your Events"
        tableView.register(Cell.self, forCellReuseIdentifier: "cellId")

        NotificationCenter.default.addObserver(self, selector: #selector(insertCell(_:)), name: NSNotification.Name(rawValue: "insert"), object: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return db.userEventName.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! Cell
        cell.nameLabel.text = db.userEventName[indexPath.row]
        cell.dateLabel.text = db.userEventDate[indexPath.row]
        cell.descriptionLabel.text = db.userEventDescription[indexPath.row]
        cell.FVC = self
        return cell
    }
    
    @objc func insertCell(_ notification: NSNotification) {
        print("insert cell print")
        if let dict = notification.userInfo as NSDictionary? {
            if let name = dict["name"] as? String {
                db.userEventName.append(name)
            }
            if let date = dict["date"] as? String {
                db.userEventDate.append(date)
            }
            if let description = dict["description"] as? String {
                db.userEventDescription.append(description)
            }
        }
        
        let insertionIndexPath = IndexPath(row: db.userEventName.count-1, section: 0)
        tableView.insertRows(at: [insertionIndexPath], with: .automatic)
    }
    
    func deleteCell(cell: UITableViewCell) {
        if let deletionIndexPath = tableView.indexPath(for: cell) {
            db.userEventName.remove(at: deletionIndexPath.row)
            db.userEventDate.remove(at: deletionIndexPath.row)
            db.userEventDescription.remove(at: deletionIndexPath.row)
            tableView.deleteRows(at: [deletionIndexPath], with: .automatic)
        }
    }
}
