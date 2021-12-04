//
//  NetworkStatusCode.swift
//  AFGithub
//
//  Created by Marko Koprivnjak on 02.12.2021..
//

import Foundation

enum NetworkStatusCode: Int {
	case OK = 200
	case Created = 201
	case NotModified = 304
	case BadRequest = 400
	case Unauthorized = 401
	case NotFound = 404
	case ValidationError = 422
	case InternalServerError = 500
	case unknow = 00
}
