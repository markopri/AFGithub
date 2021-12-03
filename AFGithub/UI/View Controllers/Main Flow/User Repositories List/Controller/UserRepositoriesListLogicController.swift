//
//  UserRepositoriesListLogicController.swift
//  AFGithub
//
//  Created by Marko Koprivnjak on 03.12.2021..
//

import Foundation

protocol UserRepositoriesListDelegate: AnyObject {
	func goToRepositoryDetails(username: String, repositoryName: String)
}

class UserRepositoriesListLogicController {
	//MARK: Properties
	typealias Handler = (UserRepositoriesListStateModel) -> Void
	weak var delegate: UserRepositoriesListDelegate?
	var username: String
	var page: Int = 0

	init(username: String) {
		self.username = username
	}

	func getUserRepositoriesList(handler: @escaping Handler) {
		handler(.loading)
		self.page += 1

		APIManagerMainFlow.searchUserRepositories(username: self.username, page: self.page) { data in
			if data.count == 0 {
				handler(.successShowInfo)
			} else {
				handler(.success(data))
			}
		} failure: { error in
			handler(.failed(error))
		}
	}
}

//MARK: UserRepositoriesList Delegate methods
extension UserRepositoriesListLogicController {
	func goToRepositoryDetails(repositoryName: String) {
		delegate?.goToRepositoryDetails(username: self.username, repositoryName: repositoryName)
	}
}
