//
//  UIColor+Extensions.swift
//  AFGithub
//
//  Created by Marko Koprivnjak on 01.12.2021..
//

import Foundation
import UIKit

extension UIColor {
	//MARK: Application
	public class var applicationBackgroundPrimary: UIColor {
		return UIColor(named: "app_background_primary")!
	}

	public class var navigationBarBackground: UIColor {
		return UIColor(named: "navigation_bar_background")!
	}

	public class var navigationBarTint: UIColor {
		return UIColor(named: "navigation_bar_tint")!
	}

	public class var loadingIndicatorTint: UIColor {
		return UIColor(named: "loading_indicator_tint")!
	}
}
