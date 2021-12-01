//
//  BaseViewController.swift
//  AFGithub
//
//  Created by Marko Koprivnjak on 01.12.2021..
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
	//MARK: Properties
	let loadingViewController = LoadingViewController()

	//MARK: Init
	public init() {
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	//MARK: View
	override func viewDidLoad() {
		super.viewDidLoad()

		let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
		tap.cancelsTouchesInView = false
		view.addGestureRecognizer(tap)
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		setupNavigation(backgroundColor: .navigationBarBackground, tintColor: .navigationBarTint)
		self.view.backgroundColor = .applicationBackgroundPrimary
	}

	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
	}
}

extension BaseViewController {
	func setupNavigation(backgroundColor: UIColor, tintColor: UIColor) {
		let appearance = UINavigationBarAppearance()
		appearance.configureWithOpaqueBackground()
		appearance.backgroundColor = backgroundColor

		self.navigationController?.navigationBar.standardAppearance = appearance
		self.navigationController?.navigationBar.standardAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: tintColor, NSAttributedString.Key.font: UIFont.navigationBarTitle]
		self.navigationController?.navigationBar.scrollEdgeAppearance = self.navigationController?.navigationBar.standardAppearance
		navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
		setNeedsStatusBarAppearanceUpdate()
	}

	@objc func dismissKeyboard() {
		view.endEditing(true)
	}
}
