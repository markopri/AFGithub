//
//  UserModel.swift
//  AFGithub
//
//  Created by Marko Koprivnjak on 02.12.2021..
//

import Foundation

class UserModel: Codable {
	let login: String
	let id: Int
	let avatarUrl: String
	let url: String
	let htmlUrl: String

	enum CodingKeys: String, CodingKey {
		case login
		case id
		case avatarUrl = "avatar_url"
		case url
		case htmlUrl = "html_url"
	}
}
