//
//  UIFont+Extensions.swift
//  AFGithub
//
//  Created by Marko Koprivnjak on 01.12.2021..
//

import Foundation
import UIKit

extension UIFont {
	//MARK: Application
	public class var navigationBarTitle: UIFont {
		return UIFont.systemFont(ofSize: 24, weight: .bold)
	}

	//MARK: Search Bar
	public class var searchBarText: UIFont {
		return UIFont.systemFont(ofSize: 16, weight: .regular)
	}

	//MARK: Table View
	public class var tableViewLabelPrimary: UIFont {
		return UIFont.systemFont(ofSize: 18, weight: .medium)
	}

	public class var tableViewLabelSecondary: UIFont {
		return UIFont.systemFont(ofSize: 16, weight: .regular)
	}

	//MARK: Label
	public class var labelInfo: UIFont {
		return UIFont.systemFont(ofSize: 20, weight: .medium)
	}
}
