//
//  WalletPresenter.swift
//  SampleBankApp
//
//  Created by José Neves on 10/03/21.
//

import Foundation


protocol WalletPresenterDelegate {
    func showUserData(name: String?, entries: Int?, value: Float?)
    func reloadEntries()
}

class WalletPresenter {
    
    var apiManager: APIManager!
    var delegate: WalletPresenterDelegate?
    
    var entries = [[String: Any]]()
    
    class func defaultPresenter() -> WalletPresenter {
        return WalletPresenter(apiManager: APIManager.defaultManager)
    }
    
    init(apiManager: APIManager!) {
        self.apiManager = apiManager
    }
    
    func delegateWillAppear() {
        self.apiManager.user(id: 1, delegate: self)
        self.apiManager.entries(delegate: self)
    }
    
    func entriesCount() -> Int {
        return self.entries.count
    }
    
    func entryByRow(_ row: Int) -> [String: Any] {
        return self.entries[row]
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
        } else {
            self.entries = objects
            self.delegate?.reloadEntries()
        }
    }
    
    func returnWithError() {
    }
}
