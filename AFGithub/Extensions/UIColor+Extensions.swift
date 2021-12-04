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

	//MARK: Search Bar
	public class var searchBarBackground: UIColor {
		return UIColor(named: "search_bar_background")!
	}

	public class var searchBarText: UIColor {
		return UIColor(named: "search_bar_text")!
	}

	public class var searchBarTint: UIColor {
		return UIColor(named: "search_bar_tint")!
	}

	//MARK: Table View
	public class var tableViewCellBackgroundPrimary: UIColor {
		return UIColor(named: "table_view_cell_background_primary")!
	}

	public class var tableViewCellLabelTextPrimary: UIColor {
		return UIColor(named: "table_view_cell_label_text_primary")!
	}

	//Label
	public class var labelTextPrimary: UIColor {
		return UIColor(named: "label_text_primary")!
	}
}
