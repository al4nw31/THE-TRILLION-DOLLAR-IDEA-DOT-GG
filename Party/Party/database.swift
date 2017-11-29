//
//  database.swift
//  Party
//
//  Created by Danny Nuch on 11/28/17.
//  Copyright © 2017 alan. All rights reserved.
//

import Foundation
import UIKit

// When Backend is done, link table entries to corresponding variables.
// All modications to cards are done in this file.
// Database is initialized in FirstViewController.swift and ButtonsView.swift

struct Database {
    
    // User Saved Events in List: FVC
    var userEventName = ["name 1", "name 2", "name 3"]
    var userEventDate = ["date 1", "date 2", "date 3"]
    var userEventDescription = ["desc 1", "desc 2", "desc 3"]
    
    // Event Cards: SVC
    var eventName: [String] = ["No Events", "PUBG Lan Party", "Collegiate LoL Tryouts", "Four Stock Fridays - SSBM Weekly"]
    var eventDate: [String] = ["No Events", "7:00 PM 12/15/17", "3 Weeks Starting Now", "6:00 PM Every Friday"]
    var eventDescription: [String] = ["No Events", "Engr Room 272", "MLK Fourth Floor", "Clark Room 343"]
    var eventUIImage: [UIImage] = [#imageLiteral(resourceName: "no-events"), #imageLiteral(resourceName: "pubg-1"), #imageLiteral(resourceName: "lol-cc"), #imageLiteral(resourceName: "ssbm")]
    var eventWebsite: [String] = ["https://twitter.com/PartyGG/", "https://playbattlegrounds.com/main.pu", "https://www.facebook.com/groups/383982935004257/", "https://goo.gl/forms/rhX1xoczqyr3fn8O2"]
    var eventLat: [Double] = [0, 37.3366703, 37.3354862, 37.3358942]
    var eventLon: [Double] = [0, -121.8822236, -121.8850388, -121.8825866]
    
    var count: Int = 0
    
    mutating func popItems() {
        eventName.remove(at: count)
        eventDate.remove(at: count)
        eventDescription.remove(at: count)
        eventUIImage.remove(at: count)
        eventWebsite.remove(at: count)
        eventLat.remove(at: count)
        eventLon.remove(at: count)
        count = count - 1
    }
}
