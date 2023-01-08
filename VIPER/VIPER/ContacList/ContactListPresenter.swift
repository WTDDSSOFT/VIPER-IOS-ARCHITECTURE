//
//  ContactListPresenter.swift
//  VIPER
//
//  Created by william torres dias dos santos on 05/01/23.
//

import UIKit

protocol ContactListPresenterInput {
   func viewWillAppear()
   func didTypePrefix(_ input: String)
   func setupTableViewProtocols(_ tableView: UITableView)
}

protocol ContactListPresenterOutput: AnyObject {
   func updateUI()
}

// implementation
final class ContactListPresenter: NSObject, ContactListPresenterInput {

   private let interactor: ContactListInteractorInput
   private let router: ContactListRouterProtocol
   weak var view: ContactListPresenterOutput?

   private var constacts: [ContactListViewModel] = [] {
      didSet {
         view?.updateUI()
      }
   }

    init(
      interactor: ContactListInteractorInput,
      router: ContactListRouterProtocol
   ) {
      self.interactor = interactor
      self.router = router
   }

   func viewWillAppear() {
      interactor.fechContactcs()
   }

   func didTypePrefix(_ input: String) {
      interactor.searchContaacts(withPrefix: input)
   }

   func setupTableViewProtocols(_ tableView: UITableView) {
      tableView.dataSource = self
      tableView.delegate = self
   }

}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension ContactListPresenter: UITableViewDelegate, UITableViewDataSource {

   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return constacts.count
   }

   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell =  tableView.dequeueReusableCell(
         withIdentifier: String(describing: ContactListTableViewCell.self),
         for: indexPath) as! ContactListTableViewCell

      cell.setupContent(constacts[indexPath.row])
      return cell
   }

   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      router.navigate(to: .details(constacts[indexPath.row].name))
   }

}

extension ContactListPresenter: ContractListInteractorOutput {

   func didFetchContacts(_ constacts: [ContactListEntity]) {
      self.constacts = constacts.map({
         ContactListViewModel(name: $0.name, image: UIImage(named: $0.image))
      })
   }

}
