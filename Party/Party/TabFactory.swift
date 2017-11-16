//
//  TabFactory.swift
//  Party
//
//  Created by Danny Nuch on 11/15/17.
//  Copyright © 2017 alan. All rights reserved.
//

import Foundation
import UIKit

enum TabFactory {
    case standardTab(title: String, VC: UIViewController, image: UIImage)
    var new: UINavigationController {
        switch self {
        case .standardTab(let title, let viewController, let image):
            return createStandardTab(title: title, VC: viewController, image: image)
        }
    }
    
    private func createStandardTab(title: String, VC: UIViewController, image: UIImage) -> UINavigationController {
        let nav = UINavigationController()
        let viewController = VC
        nav.viewControllers = [viewController]
        nav.tabBarItem = UITabBarItem(title: title, image: image, tag: 1)
        return nav
    }
}
