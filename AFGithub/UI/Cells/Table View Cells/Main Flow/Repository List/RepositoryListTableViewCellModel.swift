//
//  RepositoryListTableViewCellModel.swift
//  AFGithub
//
//  Created by Marko Koprivnjak on 03.12.2021..
//

import Foundation

struct RepositoryListTableViewCellModel {
	let name: String
	let language: String
	let watchers: Int
	let issues: Int
	let created: String

	init(name: String, language: String, watchers: Int, issues: Int, created: String) {
		self.name = name
		self.language = language
		self.watchers = watchers
		self.issues = issues
		self.created = created
	}
}
