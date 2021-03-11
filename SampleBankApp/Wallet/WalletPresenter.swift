//
//  WalletPresenter.swift
//  SampleBankApp
//
//  Created by José Neves on 10/03/21.
//

import Foundation


protocol WalletPresenterDelegate {
    func showUserData(name: String?, entries: Int?, value: Float?)
}

class WalletPresenter {
    
    var apiManager: APIManager!
    var delegate: WalletPresenterDelegate?
    
    class func defaultPresenter() -> WalletPresenter {
        return WalletPresenter(apiManager: APIManager.defaultManager)
    }
    
    init(apiManager: APIManager!) {
        self.apiManager = apiManager
    }
    
    func delegateWillAppear() {
        self.apiManager.user(id: 1, delegate: self)
    }
}

extension WalletPresenter: APIManagerDelegate {
    func returnWithObjects(_ objects: [[String: Any]]) {
        if objects.count == 1 {
            let userData = objects.first!
            
            let name = userData["name"] as? String
            let entries = userData["entries"] as? Int
            var value: Float? = nil
            
            if let valueString = userData["value"] as? String {
                value = Float(valueString)
            }
            
            delegate?.showUserData(name: name, entries: entries, value: value)
        }
    }
    
    func returnWithError() {
    }
}
