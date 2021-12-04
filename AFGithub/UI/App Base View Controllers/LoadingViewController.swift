//
//  LoadingViewController.swift
//  AFGithub
//
//  Created by Marko Koprivnjak on 01.12.2021..
//

import Foundation
import UIKit

public class LoadingViewController: UIViewController {
	//MARK: Properties
	var activityIndicator = UIActivityIndicatorView(style: .large)
	private let mainWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
	private var isLoadingViewPresented = false

	private lazy var loadingWindow: UIWindow = {
		let window = UIWindow(frame: UIScreen.main.bounds)
		window.backgroundColor = UIColor.clear
		window.rootViewController = UIViewController()
		window.windowLevel = .statusBar

		return window
	}()

	override public func viewDidLoad() {
		super.viewDidLoad()
		activityIndicator.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(activityIndicator)

		NSLayoutConstraint.activate([
			activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
		])
	}

	override public func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		//We use a 0.5 second delay to not show an activity indicator in case our data loads very quickly
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
			self?.setupLayout()
			self?.activityIndicator.startAnimating()
		}
	}
}


extension LoadingViewController {
	public func showLoadingView() {
		if !isLoadingViewPresented {
			loadingWindow.makeKeyAndVisible()
			self.modalPresentationStyle = .fullScreen
			loadingWindow.rootViewController?.present(self, animated: false, completion: nil)
		}

		isLoadingViewPresented = true
	}

	public func hideLoadingView() {
		self.mainWindow?.makeKeyAndVisible()
		self.presentingViewController?.dismiss(animated: false, completion: nil)
		loadingWindow.isHidden = true
		isLoadingViewPresented = false
	}

	private func setupLayout() {
		loadingWindow.backgroundColor = .clear
		loadingWindow.layer.opacity = 0.7
		activityIndicator.style = .large
		activityIndicator.color = .loadingIndicatorTint
	}
}
