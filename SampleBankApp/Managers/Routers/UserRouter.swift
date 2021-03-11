//
//  UserRouter.swift
//  SampleBankApp
//
//  Created by José Neves on 10/03/21.
//

import Alamofire


enum UserRouter: URLRequestConvertible {
    case get(Int)
    case getAll

    var method: Alamofire.HTTPMethod {
        switch self {
        case .get:
            return .get
        case .getAll:
            return .get
        }
    }

    var path: String {
        switch self {
        case .get(let id):
            return "/user/\(id)"
        case .getAll:
            return "/user"
        }
    }

    func asURLRequest() throws -> URLRequest {
        return URLRequest(url: URL(string: path)!)
    }
}
