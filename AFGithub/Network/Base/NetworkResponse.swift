//
//  NetworkResponse.swift
//  AFGithub
//
//  Created by Marko Koprivnjak on 02.12.2021..
//

import Foundation

enum NetworkResponse<T: Decodable> {
	case success(T)
	case failure(String)
}
