//
//  APIManagerMainFlow.swift
//  AFGithub
//
//  Created by Marko Koprivnjak on 02.12.2021..
//

import Alamofire

class APIManagerMainFlow {
	static func getAllUsers(sinceLastId: Int, completion: @escaping([UserModel]) -> (), failure: @escaping (String) -> ()) {
		AF.request(APIRouterMainFlow.getAllUsers(sinceLastId)).responseData { (response) in
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

	static func searchUsers(username: String, completion: @escaping(SearchUsersModel) -> (), failure: @escaping (String) -> ()) {
		AF.request(APIRouterMainFlow.searchUsers(username)).responseData { response in
			NetworkData.responseHandler(dataType: SearchUsersModel.self, response: response) { response in
				switch response {
					case .success(let data):
						completion(data)
					case .failure(let error):
						failure(error)
				}
			}
		}
	}

	static func searchUserRepositories(username: String, page: Int,  completion: @escaping([RepositoryModel]) -> (), failure: @escaping (String) -> ()) {
		AF.request(APIRouterMainFlow.getAllUserRepositories(username, page)).responseData { response in
			NetworkData.responseHandler(dataType: [RepositoryModel].self, response: response) { response in
				switch response {
					case .success(let data):
						completion(data)
					case .failure(let error):
						failure(error)
				}
			}
		}
	}

	static func getRepositoryDetails(username: String, repositoryName: String, completion: @escaping(RepositoryModel) -> (), failure: @escaping (String) -> ()) {
		AF.request(APIRouterMainFlow.getRepositoryDetails(username, repositoryName)).responseData { response in
			NetworkData.responseHandler(dataType: RepositoryModel.self, response: response) { response in
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
