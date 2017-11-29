//
//  SecondViewController.swift
//  Party
//
//  Created by Danny Nuch on 11/20/17.
//  Copyright © 2017 alan. All rights reserved.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    lazy var eventCard: EventCard = {
        let ec = EventCard()
        ec.SVC = self
        ec.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(swipeCard(sender:))))
        return ec
    }()
    
    lazy var buttonsContainer: ButtonsView = {
        let c = ButtonsView()
        c.SVC = self
        return c
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Events"
        view.backgroundColor = .white
        setUpViews()
        eventCard.eventWebsite = buttonsContainer.db.eventWebsite[buttonsContainer.db.count]
        changeCard(buttonsContainer.db.eventName[buttonsContainer.db.count], buttonsContainer.db.eventDate[buttonsContainer.db.count], buttonsContainer.db.eventDescription[buttonsContainer.db.count], buttonsContainer.db.eventUIImage[buttonsContainer.db.count])
    }
    
    func setUpViews() {
        view.addSubview(eventCard)
        view.addSubview(buttonsContainer)
        
        NSLayoutConstraint.activate([
            eventCard.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 10),
            eventCard.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            eventCard.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            eventCard.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.70),
            
            buttonsContainer.topAnchor.constraint(equalTo: eventCard.bottomAnchor, constant: 20),
            buttonsContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsContainer.widthAnchor.constraint(equalTo: eventCard.widthAnchor)
            ])
    }
    
    func changeCard(_ name: String, _ date: String, _ desc: String, _ image: UIImage) {
        eventCard.nameLabel.text = name
        eventCard.dateLabel.text = date
        eventCard.descriptionLabel.text = desc
        eventCard.eventImageView.image = image
    }

    @objc func swipeCard(sender: UIPanGestureRecognizer) {
        sender.swipeView(eventCard)
    }
}
