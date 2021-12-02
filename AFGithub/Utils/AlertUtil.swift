//
//  AlertUtil.swift
//  AFGithub
//
//  Created by Marko Koprivnjak on 02.12.2021..
//

import Foundation
import UIKit

public class AlertUtil: NSObject {
	private static let shared = AlertUtil()

	public static func showAlert(title: String, message: String? = nil, completion: @escaping () -> ()) {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
			completion()
		}))

		showToViewController(alert)
	}

	//MARK: Private functions
	private static func showToViewController(_ alert: UIAlertController) {
		var vc: UIViewController?

		if (UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController?.presentedViewController != nil) {
			vc = UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController?.presentedViewController
		} else {
			vc = UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController
		}

		if let vc = vc {
			vc.present(alert, animated: true, completion: nil)
		}
	}
}
