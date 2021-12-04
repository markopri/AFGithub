//
//  RepositoryDetailsStateModel.swift
//  AFGithub
//
//  Created by Marko Koprivnjak on 03.12.2021..
//

import Foundation

enum RepositoryDetailsStateModel {
	case loading
	case success(RepositoryModel)
	case failed(String)
}
