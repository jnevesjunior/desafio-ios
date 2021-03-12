//
//  LoginPresenterTests.swift
//  SampleBankAppTests
//
//  Created by José Neves on 11/03/21.
//

import XCTest
@testable import SampleBankApp


class LoginPresenterTests: XCTestCase {

    private var presenter: LoginPresenter!
    private var apiManager: APIManagerMock!
    private var delegateMock: LoginPresenterDelegateMock!

    override func setUp() {
        super.setUp()

        apiManager = APIManagerMock(apiURL: "http://localhost:8000")

        presenter = LoginPresenter(apiManager: apiManager)
        delegateMock = LoginPresenterDelegateMock()

        presenter.delegate = delegateMock

    }

    override func tearDown() {
        presenter = nil
        delegateMock = nil
        apiManager = nil

        super.tearDown()
    }

    func testViewControllerLoadElements() {
        // Given
        // Initial state

        // When

        // Then
        XCTAssertNotNil(presenter.apiManager)
        XCTAssertNotNil(presenter.delegate)
    }

    func testDelegateWantsToLoginWithInvalidData() {
        // Given
        let login = ""
        let pass = ""

        // When
        presenter.delegateWantsToLogin(login: login, pass: pass)

        // Then
        XCTAssertEqual(delegateMock.showLoginErrorCalls, 1)
        XCTAssertTrue(delegateMock.showLoginErrorLastValue!)
        XCTAssertEqual(apiManager.loginCalls, 0)
    }
    
    func testDelegateWantsToLogin() {
        // Given
        let login = "Ragnar"
        let pass = "Bjorn"
        
        apiManager.loginCompletion = { delegate in
            var json = [String: Any]()
            json["login"] = login
            json["pass"] = pass
            
            delegate?.returnWithObjects([json])
        }

        // When
        presenter.delegateWantsToLogin(login: login, pass: pass)

        // Then
        XCTAssertEqual(delegateMock.showLoadingCalls, 2)
        XCTAssertFalse(delegateMock.showLoadingLastValue!)
        XCTAssertEqual(delegateMock.showLoginErrorCalls, 1)
        XCTAssertFalse(delegateMock.showLoginErrorLastValue!)
        XCTAssertEqual(apiManager.loginCalls, 1)
        XCTAssertEqual(delegateMock.loginSuccessCalls, 1)
    }
    
    func testDelegateWantsToLoginWithError() {
        // Given
        let login = "Ragnar"
        let pass = "Bjorn"
        
        apiManager.loginCompletion = { delegate in
            delegate?.returnWithError()
        }

        // When
        presenter.delegateWantsToLogin(login: login, pass: pass)

        // Then
        XCTAssertEqual(delegateMock.showLoadingCalls, 2)
        XCTAssertFalse(delegateMock.showLoadingLastValue!)
        XCTAssertEqual(delegateMock.showLoginErrorCalls, 2)
        XCTAssertTrue(delegateMock.showLoginErrorLastValue!)
        XCTAssertEqual(apiManager.loginCalls, 1)
        XCTAssertEqual(delegateMock.loginSuccessCalls, 0)
    }

}

class APIManagerMock: APIManager {
    var loginCalls = 0
    var loginCompletion: ((_ delegate: APIManagerDelegate?) -> Void)?
    override func login(delegate: APIManagerDelegate?) {
        loginCalls += 1
        loginCompletion?(delegate)
    }
}

class LoginPresenterDelegateMock: NSObject, LoginPresenterDelegate {

    var showLoadingCalls = 0
    var showLoadingLastValue: Bool?
    func showLoading(_ isLoading: Bool) {
        showLoadingCalls += 1
        showLoadingLastValue = isLoading
    }

    var showLoginErrorCalls = 0
    var showLoginErrorLastValue: Bool?
    func showLoginError(_ isError: Bool) {
        showLoginErrorCalls += 1
        showLoginErrorLastValue = isError
    }

    var loginSuccessCalls = 0
    func loginSuccess() {
        loginSuccessCalls += 1
    }
}
