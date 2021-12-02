//
//  UsersListStateModel.swift
//  AFGithub
//
//  Created by Marko Koprivnjak on 01.12.2021..
//

import Foundation

enum UsersListStateModel {
	case loading
	case success([UserModel])
	case failed(String)
}
