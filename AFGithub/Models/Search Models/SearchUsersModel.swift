//
//  SearchUsersModel.swift
//  AFGithub
//
//  Created by Marko Koprivnjak on 02.12.2021..
//

import Foundation

class SearchUsersModel: Codable {
	let totalCount: Int
	let incompleteResults: Bool
	let items: [UserModel]

	enum CodingKeys: String, CodingKey {
		case totalCount = "total_count"
		case incompleteResults = "incomplete_results"
		case items
	}
}
