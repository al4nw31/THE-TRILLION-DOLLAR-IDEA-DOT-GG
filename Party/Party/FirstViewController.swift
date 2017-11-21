//
//  ViewController.swift
//  Party
//
//  Created by Danny Nuch on 11/20/17.
//  Copyright © 2017 alan. All rights reserved.
//

import UIKit

class FirstViewController: UITableViewController {

    var items = ["Item 1", "Item 2", "Item 3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationItem.title = "Your Events"
        tableView.register(Cell.self, forCellReuseIdentifier: "cellId")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! Cell
        cell.nameLabel.text = items[indexPath.row]
        cell.FVC = self
        return cell
    }
    
    func insertCell() {
        items.append("Item \(items.count+1)")
        let insertionIndexPath = IndexPath(row: items.count-1 , section: 0)
        tableView.insertRows(at: [insertionIndexPath], with: .automatic)
    }
    
    func deleteCell(cell: UITableViewCell) {
        if let deletionIndexPath = tableView.indexPath(for: cell) {
            items.remove(at: deletionIndexPath.row)
            tableView.deleteRows(at: [deletionIndexPath], with: .automatic)
        }
    }
}
