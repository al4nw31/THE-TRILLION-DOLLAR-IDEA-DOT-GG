//
//  BaseView.swift
//  Party
//
//  Created by Danny Nuch on 11/13/17.
//  Copyright © 2017 alan. All rights reserved.
//


import Foundation
import UIKit

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        setUpViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        //perform UI configuration in child classes
    }
}
