//
//  UsersListLogicController.swift
//  AFGithub
//
//  Created by Marko Koprivnjak on 01.12.2021..
//

import Foundation

protocol UsersListDelegate: AnyObject {
	func goToUserRepositoryList(username: String)
}

class UsersListLogicController {
	//MARK: Properties
	typealias Handler = (UsersListStateModel) -> Void
	weak var delegate: UsersListDelegate?

	func getUsersListData(username: String, then handler: @escaping Handler) {
		handler(.loading)

		if username == "" {
			APIManagerMainFlow.getAllUsers { data in
				if data.count == 0 {
					handler(.successShowInfo)
				} else {
					handler(.success(data))
				}
			} failure: { error in
				handler(.failed(error))
			}
		} else {
			APIManagerMainFlow.searchUsers(username: username) { data in
				if data.items.count == 0 {
					handler(.successShowInfo)
				} else {
					handler(.success(data.items))
				}
			} failure: { error in
				handler(.failed(error))
			}
		}
	}
}

//MARK: UserList Delegate methods
extension UsersListLogicController {
	func goToUserRepositoryList(username: String) {
		delegate?.goToUserRepositoryList(username: username)
	}
}
