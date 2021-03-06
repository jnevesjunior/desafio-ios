//
//  EntryDetail.swift
//  SampleBankApp
//
//  Created by José Neves on 10/03/21.
//

import Alamofire


enum EntryDetailRouter: URLRequestConvertible {
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
            return "/entry_detail"
        }
    }

    func asURLRequest() throws -> URLRequest {
        return URLRequest(url: URL(string: path)!)
    }
}
