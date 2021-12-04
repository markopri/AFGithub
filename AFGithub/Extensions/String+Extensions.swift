//
//  String+Extensions.swift
//  AFGithub
//
//  Created by Marko Koprivnjak on 03.12.2021..
//

import Foundation

extension String {
	public func formatServerDate() -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
		let tmpDate = dateFormatter.date(from: self) ?? Date()
		dateFormatter.dateFormat = "dd.MM.yyy"
		return dateFormatter.string(from: tmpDate)
	}
}
