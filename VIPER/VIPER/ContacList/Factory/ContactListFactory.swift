//
//  ContactListFactory.swift
//  VIPER
//
//  Created by william torres dias dos santos on 08/01/23.
//

import Foundation

enum ContactListFactory {
    static func build() -> ContactListViewController {
        let interactor = ContactListInteractor()
        let router = ContactListRouter()
        let presenter = ContactListPresenter(interactor: interactor, router: router)
        let viewController = ContactListViewController(presenter: presenter)
        interactor.presenter = presenter
        presenter.view = viewController
        router.viewController = viewController
        return viewController
    }
}
