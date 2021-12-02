//
//  UIView+Extensions.swift
//  AFGithub
//
//  Created by Marko Koprivnjak on 02.12.2021..
//

import Foundation
import UIKit

extension UIView {
	func roundViewDefault(backgroundColor: UIColor) {
		self.layer.cornerRadius = 6.0
		self.layer.borderWidth = 0.0
		self.layer.borderColor = UIColor.clear.cgColor
		self.layer.backgroundColor = backgroundColor.cgColor
	}
}
