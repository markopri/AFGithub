//
//  UsersListLogicController.swift
//  AFGithub
//
//  Created by Marko Koprivnjak on 01.12.2021..
//

import Foundation

protocol UsersListDelegate: AnyObject {
	func goToUserRepositoryList()
}

class UsersListLogicController {
	//MARK: Properties
	typealias Handler = (UsersListStateModel) -> Void
	weak var delegate: UsersListDelegate?

	func getUsersListData(handler: @escaping Handler) {
		handler(.loading)

		APIManagerMainFlow.getAllUsers { (data) in
			handler(.success(data))
		} failure: { error in
			handler(.failed(error))
		}

	}
}

//MARK: UserList Delegate methods
extension UsersListLogicController {
	func goToUserRepositoryList() {
		delegate?.goToUserRepositoryList()
	}
}
