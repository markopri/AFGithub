//
//  AppDelegate.swift
//  AFGithub
//
//  Created by Marko Koprivnjak on 01.12.2021..
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		self.window = UIWindow(frame: UIScreen.main.bounds)
		self.window?.makeKeyAndVisible()

		self.window?.rootViewController = ViewController()

		return true

	}

	func applicationWillResignActive(_ application: UIApplication) {

	}

	func applicationDidEnterBackground(_ application: UIApplication) {

	}

	func applicationWillEnterForeground(_ application: UIApplication) {

	}

	func applicationDidBecomeActive(_ application: UIApplication) {

	}

	func applicationWillTerminate(_ application: UIApplication) {

	}
}

