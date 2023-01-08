//
//  ContactListRouter.swift
//  VIPER
//
//  Created by william torres dias dos santos on 08/01/23.
//

import UIKit


enum ContactListNavigationItem {
    case details(_ name: String)
}

protocol ContactListRouterProtocol {
    func navigate(to item: ContactListNavigationItem)
}

final class ContactListRouter: ContactListRouterProtocol {
    var viewController: UIViewController?

    func navigate(to item: ContactListNavigationItem) {
        switch item {
        case let .details(name):
            let detailsViewController = ConatactDetailsFactory.build(name: name)
            viewController?.navigationController?.pushViewController(detailsViewController, animated: true)
        }
    }
}
