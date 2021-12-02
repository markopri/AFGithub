//
//  UsersListTableViewCellModel.swift
//  AFGithub
//
//  Created by Marko Koprivnjak on 02.12.2021..
//

import Foundation

struct UsersListTableViewCellModel {
	let username: String
	let avatarImageUrl: String

	init(username: String, avatarImageUrl: String) {
		self.username = username
		self.avatarImageUrl = avatarImageUrl
	}
}
