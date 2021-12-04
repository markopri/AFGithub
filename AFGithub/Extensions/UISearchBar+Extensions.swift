//
//  UISearchBar+Extensions.swift
//  AFGithub
//
//  Created by Marko Koprivnjak on 02.12.2021..
//

import Foundation
import UIKit

extension UISearchBar {
	func setupDefaultLayout() {
		self.searchBarStyle = .minimal
		self.searchTextField.backgroundColor = .searchBarBackground
		self.searchTextField.tintColor = .searchBarTint
		self.searchTextField.textColor = .searchBarText

		self.searchTextField.font = .searchBarText
	}
}
