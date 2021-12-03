//
//  RepositoryDetailsLogicController.swift
//  AFGithub
//
//  Created by Marko Koprivnjak on 03.12.2021..
//

import Foundation

class RepositoryDetailsLogicController {
	//MARK: Properties
	typealias Handler = (RepositoryDetailsStateModel) -> Void
	var username: String
	var repositoryName: String

	init(username: String, repositoryName: String) {
		self.username = username
		self.repositoryName = repositoryName
	}

	func getRepositoryDetails(handler: @escaping Handler) {
		handler(.loading)

		APIManagerMainFlow.getRepositoryDetails(username: self.username, repositoryName: self.repositoryName) { data in
			handler(.success(data))
		} failure: { error in
			handler(.failed(error))
		}
	}
}
