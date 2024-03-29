//
//  ButtonFactory.swift
//  Party
//
//  Created by Danny Nuch on 11/13/17.
//  Copyright © 2017 alan. All rights reserved.
//

import Foundation
import UIKit

enum ButtonFactory {
    case buttonWithImage(image: UIImage, cornerRadius: CGFloat, target: Any, selector: (Selector), sizeToFit: Bool)
    case standardButton(title: String, target: Any, selector: (Selector))
    var new: UIButton {
    switch self {
        case .standardButton(let title, let target, let selector):
            return createStandardButton(title: title, target: target, selector: selector)
        case .buttonWithImage(let image, let cornerRadius, let target, let selector, let sizeToFit):
            return createButtonWithImage(image: image, cornerRadius: cornerRadius, target: target, selector: selector, sizeToFit: sizeToFit)
        }
    }
    
    private func createButtonWithImage(image: UIImage, cornerRadius: CGFloat, target: Any, selector: (Selector), sizeToFit: Bool) -> UIButton {
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.addTarget(target, action: selector, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = cornerRadius
        button.clipsToBounds = true
        if sizeToFit {
            button.sizeToFit()
        }
        return button
    }
    
    private func createStandardButton(title: String, target: Any, selector: (Selector)) -> UIButton{
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.addTarget(target, action: selector, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}
