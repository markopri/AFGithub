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
}
