//
//  RepositoryModel.swift
//  AFGithub
//
//  Created by Marko Koprivnjak on 03.12.2021..
//

import Foundation

class RepositoryModel: Codable {
	let id: Int
	let name: String
	let fullName: String
	let owner: UserModel
	let url: String
	let htmlUrl: String
	let created: String
	let language: String?
	let forks: Int
	let watchers: Int
	let issues: Int

	enum CodingKeys: String, CodingKey {
		case id
		case name
		case fullName = "full_name"
		case owner
		case url
		case htmlUrl = "html_url"
		case created = "created_at"
		case language
		case forks
		case watchers
		case issues = "open_issues_count"
	}
}
