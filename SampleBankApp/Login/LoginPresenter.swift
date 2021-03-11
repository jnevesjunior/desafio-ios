//
//  File.swift
//  SampleBankApp
//
//  Created by José Neves on 10/03/21.
//

import Foundation


protocol LoginPresenterDelegate {
    func showLoading(_ isLoading: Bool)
    func showErrorMessage()
    func showLoginError(_ isError: Bool)
    func loginSuccess()
}

class LoginPresenter {
    
    var apiManager: APIManager!
    var delegate: LoginPresenterDelegate?
    
    private var userLogin = ""
    private var userPass = ""
    
    class func defaultPresenter() -> LoginPresenter {
        return LoginPresenter(apiManager: APIManager.defaultManager)
    }
    
    init(apiManager: APIManager!) {
        self.apiManager = apiManager
    }
    
    func delegateWantsToLogin(login: String, pass: String) {
        let isValidLogin = self.isValidLogin(login)
        let isValidPass = self.isValidPass(pass)
        
        if !isValidLogin || !isValidPass {
            delegate?.showLoginError(true)
            return
        }
        delegate?.showLoading(true)
        delegate?.showLoginError(false)
        
        self.userLogin = login
        self.userPass = pass
        
        apiManager.login(delegate: self)
        
    }
    
    private func isValidLogin(_ login: String) -> Bool {
        return login.count > 3
    }
    
    private func isValidPass(_ pass: String) -> Bool {
        return pass.count > 3
    }
    
}

extension LoginPresenter: APIManagerDelegate {
    func returnWithObjects(_ objects: [[String: Any]]) {
        delegate?.showLoading(false)
        
        //replace with backend validation
        for object in objects {
            guard let login = object["login"] as? String,
                  let pass = object["pass"] as? String else {
                return
            }
            
            if login == self.userLogin && pass == self.userPass {
                delegate?.loginSuccess()
            }
        }
    }
    
    func returnWithError() {
        delegate?.showLoading(false)
        delegate?.showErrorMessage()
    }
}
