//
//  UserRepositoriesListViewController.swift
//  AFGithub
//
//  Created by Marko Koprivnjak on 03.12.2021..
//

import UIKit

class UserRepositoriesListViewController: BaseViewController {
	//MARK: Outlets
	@IBOutlet weak var tableView: UITableView!

	//MARK: Properties
	private var logicController: UserRepositoriesListLogicController
	var tableViewDataList: [RepositoryModel] = []

	//MARK: Initializers
	init(logicController: UserRepositoriesListLogicController) {
		self.logicController = logicController
		super.init()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	//MARK: View
	override func viewDidLoad() {
        super.viewDidLoad()

		self.navigationItem.title = logicController.username

		tableView.register(UINib(nibName: "RepositoryListTableViewCell", bundle: nil), forCellReuseIdentifier: "RepositoryListTableViewCell")
    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		preformInitalStateActions()
	}
}

extension UserRepositoriesListViewController {
	func preformInitalStateActions() {
		tableViewDataList.removeAll()

		logicController.getUserRepositoriesList { [weak self] state in
			self?.handleState(state)
		}
	}
}

//MARK: UITableView Datasource/Delegate
extension UserRepositoriesListViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return tableViewDataList.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryListTableViewCell", for: indexPath) as! RepositoryListTableViewCell
		let model = RepositoryListTableViewCellModel(name: tableViewDataList[indexPath.row].name, language: tableViewDataList[indexPath.row].language ?? "Undefined language", watchers: tableViewDataList[indexPath.row].watchers, issues: tableViewDataList[indexPath.row].issues, created: tableViewDataList[indexPath.row].created)

		cell.setupLayout(model: model)

		return cell
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		logicController.goToRepositoryDetails(repositoryName: self.tableViewDataList[indexPath.row].name)
	}
}

//MARK: State Model extension
private extension UserRepositoriesListViewController {
	func handleState(_ state: UserRepositoriesListStateModel) {
		switch state {
			case .loading:
				loadingViewController.showLoadingView()
			case .success(let data):
				loadingViewController.hideLoadingView()
				self.tableViewDataList = data
				tableView.reloadData()
			case .failed(let error):
				loadingViewController.hideLoadingView()
				self.tableViewDataList.removeAll()
				tableView.reloadData()
				AlertUtil.showAlert(title: error) {
					print("INFO: UserRepositoriesListViewController -> User clicked OK on alert for failure")
				}
		}
	}
}
