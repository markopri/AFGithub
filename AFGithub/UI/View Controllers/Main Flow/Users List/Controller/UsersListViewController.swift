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
	@IBOutlet weak var lblInfo: UILabel!

	//MARK: Properties
	private var logicController: UsersListLogicController
	var tableViewDataList: [UserModel] = []

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
		preformInitalStateActions()

		tableView.register(UINib(nibName: "UsersListTableViewCell", bundle: nil), forCellReuseIdentifier: "UsersListTableViewCell")
    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		setupLayout()
	}
}

extension UsersListViewController {
	func preformInitalStateActions() {
		tableViewDataList.removeAll()

		logicController.getUsersListData(username: "") { [weak self] state in
			self?.handleState(state)
		}
	}

	func setupLayout() {
		searchBar.placeholder = "Enter username"
		searchBar.setupDefaultLayout()

		lblInfo.text = "There is currently no data to display. Please try again with different search term or try again later."
		lblInfo.font = .labelInfo
		lblInfo.textColor = .labelTextPrimary
		lblInfo.isHidden = true
	}
}

//MARK: UITableView Datasource/Delegate
extension UsersListViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return tableViewDataList.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "UsersListTableViewCell", for: indexPath) as! UsersListTableViewCell
		let model = UsersListTableViewCellModel(username: tableViewDataList[indexPath.row].login, avatarImageUrl: tableViewDataList[indexPath.row].avatarUrl)

		cell.setupLayout(model: model)

		if (indexPath.row == tableViewDataList.count - 1 && (indexPath.row+1) % 30 == 0) {
			logicController.getUsersListData(username: logicController.username, sinceLastId: tableViewDataList[indexPath.row].id) { [weak self] state in
				self?.handleState(state)
			}
		}

		return cell
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		logicController.goToUserRepositoryList(username: tableViewDataList[indexPath.row].login)
	}
}

//MARK: UISearchBar Delegate
extension UsersListViewController: UISearchBarDelegate {
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		searchBar.resignFirstResponder()
		self.tableViewDataList.removeAll()

		logicController.getUsersListData(username: searchBar.searchTextField.text ?? "") { [weak self] state in
			self?.handleState(state)
		}
	}
}

//MARK: State Model extension
private extension UsersListViewController {
	func handleState(_ state: UsersListStateModel) {
		switch state {
			case .loading:
				loadingViewController.showLoadingView()
			case .success(let data):
				loadingViewController.hideLoadingView()
				executeStateSuccess(data: data)
			case .successShowInfo:
				loadingViewController.hideLoadingView()
				executeStateSuccessShowInfo()
			case .failed(let error):
				loadingViewController.hideLoadingView()
				executeStateSuccessShowInfo()
				AlertUtil.showAlert(title: error) {
					print("INFO: UsersListViewController -> User clicked OK on alert for failure")
				}
		}
	}

	func executeStateSuccess(data: [UserModel]) {
		self.tableViewDataList.append(contentsOf: data)
		lblInfo.isHidden = true
		tableView.reloadData()
	}

	func executeStateSuccessShowInfo() {
		self.tableViewDataList.removeAll()
		lblInfo.isHidden = false
		tableView.reloadData()
	}
}
