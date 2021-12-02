//
//  APIManagerMainFlow.swift
//  AFGithub
//
//  Created by Marko Koprivnjak on 02.12.2021..
//

import Alamofire

class APIManagerMainFlow {
	static func getAllUsers(completion: @escaping([UserModel]) -> (), failure: @escaping (String) -> ()) {
		AF.request(APIRouterMainFlow.getAllUsers).responseData { (response) in
			NetworkData.responseHandler(dataType: [UserModel].self, response: response) { response in
				switch response {
					case .success(let data):
						completion(data)
					case .failure(let error):
						failure(error)
				}
			}
		}
	}
}
