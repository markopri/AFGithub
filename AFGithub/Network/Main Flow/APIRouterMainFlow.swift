//
//  APIRouterMainFlow.swift
//  AFGithub
//
//  Created by Marko Koprivnjak on 02.12.2021..
//

import Alamofire

enum APIRouterMainFlow: URLRequestConvertible {
	case getAllUsers(Int)
	case searchUsers(String)
	case getAllUserRepositories(String)
	case getRepositoryDetails(String, String)

	var path: String {
		switch self {
			case .getAllUsers:
				return "/users"
			case .searchUsers:
				return "/search/users"
			case .getAllUserRepositories(let username):
				return "/users/\(username)/repos"
			case .getRepositoryDetails(let username, let repositoryName):
				return "/repos/\(username)/\(repositoryName)"
		}
	}

	var method: HTTPMethod {
		switch self {
			case .getAllUsers:
				return .get
			case .searchUsers:
				return .get
			case .getAllUserRepositories:
				return .get
			case .getRepositoryDetails:
				return .get
		}
	}

	var parameters: Parameters {
		switch self {
			case .getAllUsers(let sinceLastId):
				return["since": sinceLastId]
			case .searchUsers(let username):
				return ["q": username]
			default:
				return [:]
		}
	}

	func asURLRequest() throws -> URLRequest {
		let urlBase = URL(string: Bundle.main.infoDictionary!["API_BASE_URL_ENDPOINT"] as! String)
		let url = urlBase?.appendingPathComponent(path)

		var urlRequest = try URLRequest(url: url!, method: method)
		urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")

		return try URLEncoding.default.encode(urlRequest, with: parameters)
	}
}
