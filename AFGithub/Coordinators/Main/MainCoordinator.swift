//
//  MainCoordinator.swift
//  AFGithub
//
//  Created by Marko Koprivnjak on 01.12.2021..
//

import Foundation
import UIKit

class MainCoordinator: RootViewCoordinator {
	//MARK: Properties
	var childCoordinators: [Coordinator] = []
	var rootViewController: UIViewController

	private var navigationController: UINavigationController {
		return self.rootViewController as! UINavigationController
	}

	//MARK: Initializer
	init(rootViewController: UIViewController) {
		self.rootViewController = rootViewController
	}

	func startCoordinator() {
		let logicController = UsersListLogicController()
		logicController.delegate = self

		let viewController = UsersListViewController(logicController: logicController)
		self.navigationController.pushViewController(viewController, animated: true)
	}
}

extension MainCoordinator: UsersListDelegate {
	func goToUserRepositoryList() {
		print("UserListDelegate: Connect to next view controller")
	}
}
