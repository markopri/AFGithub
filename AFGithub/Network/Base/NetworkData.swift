//
//  NetworkData.swift
//  AFGithub
//
//  Created by Marko Koprivnjak on 02.12.2021..
//

import Alamofire

class NetworkData {
	static func responseHandler<T: Codable>(dataType: T.Type, response: AFDataResponse<Data>, onComplete: @escaping (NetworkResponse<T>) -> Void) {
		let statusCode = response.response?.statusCode ?? 00
		guard let statusCodeType = NetworkStatusCode(rawValue: statusCode) else {
			onComplete(.failure("Unknown error."))
			return
		}

		switch response.result {
		case .success(let data):
			switch statusCodeType {
			case .OK, .Created:
				do {
					let encodedData = try JSONDecoder().decode(T.self, from: data)
					onComplete(.success(encodedData))
				} catch(_) {
					onComplete(.failure("Couldn't parse data."))
					return
				}
			case .NotModified:
				onComplete(.failure("Not modified."))
			case .BadRequest:
				onComplete(.failure("Bad request."))
			case .Unauthorized:
				onComplete(.failure("Unauthorized."))
			case .NotFound:
				onComplete(.failure("Not found."))
			case .ValidationError:
				onComplete(.failure("Validation failed."))
			case .InternalServerError:
				onComplete(.failure("Internal Server Error."))
			default:
				onComplete(.failure("Something went wrong."))
			}
		case .failure:
			onComplete(.failure("Something went wrong."))
		}
	}
}
