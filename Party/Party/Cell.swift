//
//  Cell.swift
//  Party
//
//  Created by Danny Nuch on 11/20/17.
//  Copyright © 2017 alan. All rights reserved.
//

import Foundation
import UIKit

class Cell: UITableViewCell {
    
    var FVC: FirstViewController?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nameLabel = LabelFactory.standardLabel(text: "Some event", textColor: .black, fontStyle: .headline, textAlignment: .left, sizeToFit: false,
                                               adjustToFit: true).new
    let dateLabel = LabelFactory.standardLabel(text: "Some date", textColor: .gray, fontStyle: .subheadline, textAlignment: .left, sizeToFit: false,
                                               adjustToFit: true).new
    let descriptionLabel = LabelFactory.standardLabel(text: "Some desc", textColor: .gray, fontStyle: .body, textAlignment: .left, sizeToFit: false,
                                               adjustToFit: true).new
    
    lazy var deleteButton: UIButton = {
        let button = ButtonFactory.standardButton(title: "Delete", target: self, selector: #selector(deleteAction)).new
        return button
    }()
    
    @objc func deleteAction() {
        print("Delete print")
        FVC?.deleteCell(cell: self)
    }
    
    func setupViews() {
        addSubview(nameLabel)
        addSubview(deleteButton)
        addSubview(dateLabel)
        addSubview(descriptionLabel)
        
        // Horizontal Constraint
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-8-[v1(80)]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel, "v1": deleteButton]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": dateLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": descriptionLabel]))
        
        // Vertical Constraint
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-2-[v0]-5-[v1]-5-[v2]-2-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel, "v1": dateLabel, "v2": descriptionLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": deleteButton]))
    }
}
