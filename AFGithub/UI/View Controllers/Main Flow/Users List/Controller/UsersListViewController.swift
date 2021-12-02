//
//  UsersListViewController.swift
//  AFGithub
//
//  Created by Marko Koprivnjak on 01.12.2021..
//

import UIKit

class UsersListViewController: BaseViewController {
	//MARK: Outlets
	@IBOutlet weak var searchBar: UISearchBar!
	@IBOutlet weak var tableView: UITableView!

	//MARK: Properties
	private var logicController: UsersListLogicController

	//MARK: Initializers
	init(logicController: UsersListLogicController) {
		self.logicController = logicController
		super.init()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	//MARK: View
    override func viewDidLoad() {
        super.viewDidLoad()

		self.navigationItem.title = "Users"

		tableView.register(UINib(nibName: "UsersListTableViewCell", bundle: nil), forCellReuseIdentifier: "UsersListTableViewCell")
    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		setupLayout()
	}

}

extension UsersListViewController {
	func setupLayout() {
		searchBar.placeholder = "Enter username"
		searchBar.setupDefaultLayout()
	}
}

//MARK: UITableView Datasource/Delegate
extension UsersListViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 15
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "UsersListTableViewCell", for: indexPath) as! UsersListTableViewCell
		cell.setupLayout()

		return cell
	}
}

//MARK: UISearchBar Delegate
extension UsersListViewController: UISearchBarDelegate {
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		searchBar.resignFirstResponder()
	}
}

//MARK: State Model extension
private extension UsersListViewController {
	func handleState(_ state: UsersListStateModel) {
		switch state {
			case .loading:
				loadingViewController.showLoadingView()
			case .success:
				loadingViewController.hideLoadingView()
			case .failed:
				loadingViewController.hideLoadingView()
		}
	}
}
