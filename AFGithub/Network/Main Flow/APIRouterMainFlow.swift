//
//  APIRouterMainFlow.swift
//  AFGithub
//
//  Created by Marko Koprivnjak on 02.12.2021..
//

import Alamofire

enum APIRouterMainFlow: URLRequestConvertible {
	case getAllUsers

	var path: String {
		switch self {
			case .getAllUsers:
				return "/users"
		}
	}

	var method: HTTPMethod {
		switch self {
			case .getAllUsers:
				return .get
		}
	}

	var parameters: Parameters {
		return [:]
	}

	func asURLRequest() throws -> URLRequest {
		let urlBase = URL(string: Bundle.main.infoDictionary!["API_BASE_URL_ENDPOINT"] as! String)
		let url = urlBase?.appendingPathComponent(path)

		var urlRequest = try URLRequest(url: url!, method: method)
		urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")

		return try URLEncoding.default.encode(urlRequest, with: parameters)
	}
}
