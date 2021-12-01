//
//  AppCoordinator.swift
//  AFGithub
//
//  Created by Marko Koprivnjak on 01.12.2021..
//

import Foundation
import UIKit

class AppCoordinator: RootViewCoordinator {
	//MARK: Properties
	var childCoordinators: [Coordinator] = []
	var rootViewController: UIViewController = UINavigationController()
	let window: UIWindow

	//MARK: Initializer
	public init(window: UIWindow) {
		self.window = window

		self.window.rootViewController = rootViewController
		self.window.makeKeyAndVisible()
	}

	public func startCoordinator() {
		self.rootViewController = UINavigationController()
		self.window.rootViewController = self.rootViewController

		let mainCoordinator = MainCoordinator(rootViewController: rootViewController)
		mainCoordinator.startCoordinator()
		self.addChildCoordinator(mainCoordinator)
	}
}
