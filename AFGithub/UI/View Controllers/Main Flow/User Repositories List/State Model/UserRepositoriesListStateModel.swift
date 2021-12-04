//
//  UserRepositoriesListStateModel.swift
//  AFGithub
//
//  Created by Marko Koprivnjak on 03.12.2021..
//

import Foundation

enum UserRepositoriesListStateModel {
	case loading
	case success([RepositoryModel])
	case successShowInfo
	case failed(String)
}
