//
//  APIManager.swift
//  SampleBankApp
//
//  Created by José Neves on 10/03/21.
//

import Foundation
import Alamofire
import SwiftyJSON


protocol APIManagerDelegate {
    func returnWithObjects(_ objects: [[String: Any]])
    func returnWithError()
}

class APIManager {

    var apiURL = ""

    static let defaultManager: APIManager = {
        return APIManager(apiURL: "https://604952fffb5dcc0017969d43.mockapi.io")
    }()

    init(apiURL: String) {
        self.apiURL = apiURL
    }

    func login(delegate: APIManagerDelegate?) {
        sendRequest(routerURLRequest: LoginRouter.get, delegate: delegate)
    }
    
    func user(id: Int, delegate: APIManagerDelegate?) {
        sendRequest(routerURLRequest: UserRouter.get(id), delegate: delegate)
    }

    private func sendRequest(routerURLRequest: URLRequestConvertible,
                             delegate: APIManagerDelegate?) {

        var urlRequest = try! URLEncoding.default.encode(routerURLRequest, with: nil)
        urlRequest.url = URL(string: apiURL + urlRequest.url!.absoluteString)

        AF.request(urlRequest)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
            switch response.result {
            case .success(let value):
                self.parseResponseValue(value, delegate: delegate)
            case .failure(_):
                delegate?.returnWithError()
                break
            }
        }
    }

    private func parseResponseValue(_ jsonObject: Any,
                                    delegate: APIManagerDelegate?) {

        if let jsonObjects = jsonObject as? [[String: Any]] {
            delegate?.returnWithObjects(jsonObjects)
        } else if let jsonObjects = jsonObject as? [String: Any] {
            delegate?.returnWithObjects([jsonObjects])
        } else {
            delegate?.returnWithError()
        }
    }
}
