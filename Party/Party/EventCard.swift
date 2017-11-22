//
//  EventCard.swift
//  Party
//
//  Created by Danny Nuch on 11/13/17.
//  Copyright © 2017 alan. All rights reserved.
//

import Foundation
import UIKit

class EventCard: BaseView {
    
    var SVC: SecondViewController? = nil
    
    let eventImageView = ImageViewFactory.standardImageView(image: #imageLiteral(resourceName: "ssbm"), cornerRadius: 0, interactionEnabled: true, contentMode: .scaleAspectFill, sizeToFit: false).new
    
    lazy var websiteButton: UIButton = {
        let b = ButtonFactory.buttonWithImage(image: #imageLiteral(resourceName: "friendsIcon"), cornerRadius: 0, target: self, selector: #selector(website), sizeToFit: true).new
        return b
    }()
    
    let wv = WebView()
    
    @objc func website() {
        print("website print")
        SVC?.view.addSubview(wv.webView)
        let backButton = UIBarButtonItem(title: NSLocalizedString("Back", comment: "Back"), style: .plain, target: self, action: #selector(popWebView))
        SVC?.navigationItem.setLeftBarButton(backButton, animated: false)
    }
    
    @objc func popWebView() {
        print("webview Popped")
        SVC?.navigationItem.setLeftBarButton(nil, animated: false)
        wv.webView.removeFromSuperview()
    }
    
    let containerView: BaseView = {
        let v = BaseView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 10.0
        v.layer.borderWidth = 0.5
        v.layer.borderColor = UIColor.gray.cgColor
        v.clipsToBounds = true
        return v
    }()
    
    let infoContainerView: BaseView = {
        let v = BaseView()
        return v
    }()
    
    let nameLabel = LabelFactory.standardLabel(text: "Four Stock Fridays - SSBM Weekly", textColor: .gray, fontStyle: .headline, textAlignment: .left, sizeToFit: true, adjustToFit: true).new
    
    let dateLabel = LabelFactory.standardLabel(text: "6:00 PM Every Friday", textColor: .gray, fontStyle: .subheadline, textAlignment: .left, sizeToFit: true, adjustToFit: true).new
    
    let descriptionLabel = LabelFactory.standardLabel(text: "ENGR Room 343", textColor: .gray, fontStyle: .subheadline, textAlignment: .left, sizeToFit: true, adjustToFit: true).new
    
    override func setUpViews() {
        
        addSubview(containerView)
        containerView.addSubview(eventImageView)
        containerView.addSubview(infoContainerView)
        infoContainerView.addSubview(nameLabel)
        infoContainerView.addSubview(dateLabel)
        infoContainerView.addSubview(descriptionLabel)
        infoContainerView.addSubview(websiteButton)
        
        let infoContainerViewMargins = infoContainerView.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.widthAnchor.constraint(equalTo: widthAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            eventImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            eventImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            eventImageView.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            eventImageView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.85),
            
            infoContainerView.topAnchor.constraint(equalTo: eventImageView.bottomAnchor),
            infoContainerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            infoContainerView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            infoContainerView.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            
            websiteButton.centerYAnchor.constraint(equalTo: infoContainerViewMargins.centerYAnchor),
            websiteButton.heightAnchor.constraint(equalTo: infoContainerViewMargins.heightAnchor, multiplier: 0.7),
            websiteButton.widthAnchor.constraint(equalTo: websiteButton.heightAnchor),
            websiteButton.trailingAnchor.constraint(equalTo: infoContainerViewMargins.trailingAnchor),
            
            nameLabel.leadingAnchor.constraint(equalTo: infoContainerViewMargins.leadingAnchor),
            nameLabel.topAnchor.constraint(equalTo: infoContainerViewMargins.topAnchor),
            
            dateLabel.leadingAnchor.constraint(equalTo: infoContainerViewMargins.leadingAnchor),
            dateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: infoContainerViewMargins.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: websiteButton.leadingAnchor, constant: -20)
            ])
    }
}
