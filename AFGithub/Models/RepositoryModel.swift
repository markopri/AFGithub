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
	let desc: String?
	let defaultBranch: String
	let hasIssues: Bool
	let hasProjects: Bool
	let hasDownloads: Bool
	let hasWiki: Bool
	let hasPages: Bool
	let archived: Bool
	let disabled: Bool

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
		case desc = "description"
		case defaultBranch = "default_branch"
		case hasIssues = "has_issues"
		case hasProjects = "has_projects"
		case hasDownloads = "has_downloads"
		case hasWiki = "has_wiki"
		case hasPages = "has_pages"
		case archived
		case disabled
	}
}
