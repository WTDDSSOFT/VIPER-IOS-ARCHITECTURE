//
//  ContacListInteractor.swift
//  VIPER
//
//  Created by william torres dias dos santos on 05/01/23.
//

import Foundation

// User cases
protocol ContactListInteractorInput {
   func fechContactcs()
   func searchContaacts(withPrefix prefix: String)
}

// Lower layer
protocol ContractListInteractorOutput: AnyObject {
   func didFetchContacts(_ constacts: [ContactListEntity])
}


// Implementation of the Interactor
final class ContactListInteractor: ContactListInteractorInput {

   private var contacts: [ContactListEntity] = []

   weak var presenter: ContractListInteractorOutput?

   func fechContactcs() {
      contacts = ContactListEntity.stub
      presenter?.didFetchContacts(contacts)
   }

   func searchContaacts(withPrefix prefix: String) {
      let filtered = contacts.filter { $0.name.hasPrefix(prefix) }
      presenter?.didFetchContacts(filtered)
   }

}
