//
//  RepositoryDetailsViewController.swift
//  AFGithub
//
//  Created by Marko Koprivnjak on 03.12.2021..
//

import UIKit

class RepositoryDetailsViewController: BaseViewController {
	//MARK: Outlets
	@IBOutlet weak var tableView: UITableView!

	//MARK: Properties
	private var logicController: RepositoryDetailsLogicController
	var tableViewData: RepositoryModel? = nil

	//MARK: Initializers
	init(logicController: RepositoryDetailsLogicController) {
		self.logicController = logicController
		super.init()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()

		self.navigationItem.title = logicController.repositoryName
		preformInitalStateActions()

		tableView.register(UINib(nibName: "RepositoryDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "RepositoryDetailsTableViewCell")
    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}
}

extension RepositoryDetailsViewController {
	func preformInitalStateActions() {
		logicController.getRepositoryDetails { [weak self] state in
			self?.handleState(state)
		}
	}

	func determineTableViewCellContent(fieldIndex: Int) -> String {
		switch fieldIndex {
			case 0:
				return "Name: \(self.tableViewData!.name)"
			case 1:
				return "Full name: \(self.tableViewData!.fullName)"
			case 2:
				return "Description: \(self.tableViewData?.desc ?? "No description is provided")"
			case 3:
				return "Created: \(self.tableViewData!.created.formatServerDate())"
			case 4:
				return "Language: \(self.tableViewData?.language ?? "Undefined")"
			case 5:
				return "Issues: \(self.tableViewData!.issues)"
			case 6:
				return "Watchers: \(self.tableViewData!.watchers)"
			case 7:
				return "Forks: \(self.tableViewData!.forks)"
			case 8:
				return "Has issues: \(self.tableViewData!.hasIssues)"
			case 9:
				return "Has projects: \(self.tableViewData!.hasProjects)"
			case 10:
				return "Has wiki: \(self.tableViewData!.hasWiki)"
			case 11:
				return "Has pages: \(self.tableViewData!.hasPages)"
			case 12:
				return "Has downloads: \(self.tableViewData!.hasDownloads)"
			case 13:
				return "Archived: \(self.tableViewData!.archived)"
			default:
				return "Undefined"
		}
	}
}

//MARK: UITableView Datasource/Delegate
extension RepositoryDetailsViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if self.tableViewData == nil {
			return 0
		}

		return 14
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryDetailsTableViewCell", for: indexPath) as! RepositoryDetailsTableViewCell
		let model = RepositoryDetailsTableViewCellModel(content: determineTableViewCellContent(fieldIndex: indexPath.row))

		cell.setupLayout(model: model)

		return cell
	}
}

//MARK: State Model extension
private extension RepositoryDetailsViewController {
	func handleState(_ state: RepositoryDetailsStateModel) {
		switch state {
			case .loading:
				loadingViewController.showLoadingView()
			case .success(let data):
				loadingViewController.hideLoadingView()
				self.tableViewData = data
				tableView.reloadData()
			case .failed(let error):
				loadingViewController.hideLoadingView()
				self.tableViewData = nil
				tableView.reloadData()
				AlertUtil.showAlert(title: error) {
					print("INFO: RepositoryDetailsViewController -> User clicked OK on alert for failure")
				}
		}
	}
}
