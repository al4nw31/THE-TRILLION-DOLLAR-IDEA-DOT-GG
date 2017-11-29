//
//  ButtonsView.swift
//  Party
//
//  Created by Danny Nuch on 11/13/17.
//  Copyright © 2017 alan. All rights reserved.
//

import Foundation
import UIKit

class ButtonsView: BaseView {
    
    var SVC: SecondViewController? = nil
    
    var db = Database()
    
    lazy var likeButton: UIButton = {
        let b = ButtonFactory.buttonWithImage(image: #imageLiteral(resourceName: "like"), cornerRadius: 0, target: self, selector: #selector(like), sizeToFit: true).new
        return b
    }()
    
    lazy var passButton: UIButton = {
        let b = ButtonFactory.buttonWithImage(image: #imageLiteral(resourceName: "pass"), cornerRadius: 0, target: self, selector: #selector(pass), sizeToFit: true).new
        return b
    }()
    
    lazy var mapButton: UIButton = {
        let b = ButtonFactory.buttonWithImage(image: #imageLiteral(resourceName: "map"), cornerRadius: 0, target: self, selector: #selector(map), sizeToFit: true).new
        return b
    }()
    
    lazy var container: UIStackView = {
        let c = UIStackView(arrangedSubviews: [
            self.likeButton, self.passButton, self.mapButton
            ])
        c.translatesAutoresizingMaskIntoConstraints = false
        c.spacing = 20
        c.distribution = .fillEqually
        return c
    }()
    
    override func setUpViews() {
        addSubview(container)
        db.count = db.eventName.count - 1
        
        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.topAnchor.constraint(equalTo: topAnchor),
            container.widthAnchor.constraint(equalTo: widthAnchor),
            container.heightAnchor.constraint(equalTo: heightAnchor)
            ])
    }
    
    @objc func like() {
        print("like print")
        if db.count > 0 {
            let dict: [String: String] = ["name": db.eventName[db.count], "date": db.eventDate[db.count], "description": db.eventDescription[db.count]]
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "insert"), object: nil, userInfo: dict)
            
            db.popItems()
            SVC?.eventCard.eventWebsite = db.eventWebsite[db.count]
            SVC?.changeCard(db.eventName[db.count], db.eventDate[db.count], db.eventDescription[db.count], db.eventUIImage[db.count])
        }
    }
    
    @objc func pass() {
        print("pass print")
        if db.count > 0 {
            db.popItems()
            SVC?.eventCard.eventWebsite = db.eventWebsite[db.count]
            SVC?.changeCard(db.eventName[db.count], db.eventDate[db.count], db.eventDescription[db.count], db.eventUIImage[db.count])
        }
    }
    
    let mv = MapView()
    
    @objc func map() {
        print("map print")
        if db.count > 0 {
            mv.addMarker(lat: db.eventLat[db.count], lon: db.eventLon[db.count])
            SVC?.view.addSubview(mv.mapView)
            let backButton = UIBarButtonItem(title: NSLocalizedString("Back", comment: "Back"), style: .plain, target: self, action: #selector(popMapView))
            SVC?.navigationItem.setLeftBarButton(backButton, animated: false)
        }
    }
    
    @objc func popMapView() {
        print("mapview popped")
        mv.removeAnnotation()
        SVC?.navigationItem.setLeftBarButton(nil, animated: false)
        mv.mapView.removeFromSuperview()
    }
}
