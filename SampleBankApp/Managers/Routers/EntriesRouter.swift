//
//  EntriesRouter.swift
//  SampleBankApp
//
//  Created by José Neves on 11/03/21.
//

import Alamofire


enum EntriesRouter: URLRequestConvertible {
    case get

    var method: Alamofire.HTTPMethod {
        switch self {
        case .get:
            return .get
        }
    }

    var path: String {
        switch self {
        case .get:
            return "/entry"
        }
    }

    func asURLRequest() throws -> URLRequest {
        return URLRequest(url: URL(string: path)!)
    }
}
