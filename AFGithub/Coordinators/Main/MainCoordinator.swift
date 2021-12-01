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
		let viewController = ViewController()
		self.navigationController.pushViewController(viewController, animated: true)
	}
}
