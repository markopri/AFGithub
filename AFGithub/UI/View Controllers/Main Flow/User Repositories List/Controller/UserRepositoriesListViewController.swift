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
	@IBOutlet weak var lblInfo: UILabel!

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
		preformInitalStateActions()

		tableView.register(UINib(nibName: "RepositoryListTableViewCell", bundle: nil), forCellReuseIdentifier: "RepositoryListTableViewCell")
    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		setupLayout()
	}
}

extension UserRepositoriesListViewController {
	func preformInitalStateActions() {
		tableViewDataList.removeAll()

		logicController.getUserRepositoriesList { [weak self] state in
			self?.handleState(state)
		}
	}

	func setupLayout() {
		lblInfo.text = "There is currently no data to display. Please try again with different user or try again later."
		lblInfo.font = .labelInfo
		lblInfo.textColor = .labelTextPrimary
		lblInfo.isHidden = true
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

		if (indexPath.row == tableViewDataList.count - 1 && (indexPath.row+1) % 30 == 0) {
			logicController.getUserRepositoriesList { [weak self] state in
				self?.handleState(state)
			}
		}


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
				executeStateSuccess(data: data)
			case .successShowInfo:
				loadingViewController.hideLoadingView()
				executeStateSuccessShowInfo()
			case .failed(let error):
				loadingViewController.hideLoadingView()
				executeStateSuccessShowInfo()
				AlertUtil.showAlert(title: error) {
					print("INFO: UserRepositoriesListViewController -> User clicked OK on alert for failure")
				}
		}
	}

	func executeStateSuccess(data: [RepositoryModel]) {
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
