//
//  ConatactDetailsFactory.swift
//  VIPER
//
//  Created by william torres dias dos santos on 08/01/23.
//

import Foundation


enum ConatactDetailsFactory {
    static func build(name: String) -> ContactDetailsViewController {
        let interactor = ContactDetailsInteractor()
        let presenter = ContactDetailsPresenter(interactor: interactor, name: name)
        let viewController = ContactDetailsViewController(presenter: presenter)
        interactor.presenter = presenter
        presenter.view = viewController
        return viewController
    }
}
