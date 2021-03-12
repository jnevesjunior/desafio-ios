//
//  LoginViewControllerTests.swift
//  SampleBankAppTests
//
//  Created by José Neves on 04/03/21.
//

import XCTest
@testable import SampleBankApp


class LoginViewControllerTests: XCTestCase {

    var viewController: LoginViewController!
    private var presenterMock: LoginPresenterMock!

    override func setUp() {
        super.setUp()

        presenterMock = LoginPresenterMock(apiManager: APIManager.defaultManager)

        viewController = LoginViewController()
        viewController.loadView()
        viewController.presenter = presenterMock
    }

    override func tearDown() {
        viewController = nil
        presenterMock = nil

        super.tearDown()
    }

    func testViewControllerLoadElements() {
        // Given
        // Initial state

        // When

        // Then
        XCTAssertNotNil(viewController.logoImageView)
        XCTAssertNotNil(viewController.loginTextField)
        XCTAssertNotNil(viewController.passTextField)
        XCTAssertNotNil(viewController.loginButton)
        XCTAssertNotNil(viewController.errorLabel)
        XCTAssertNotNil(viewController.resetPassButton)
    }

    func testLoginActionWithInvalidData() {
        // Given
        // Initial state

        // When
        viewController.loginButtonAction(sender: viewController.loginButton!)

        // Then
        XCTAssertEqual(presenterMock.delegateWantsToLoginCalls, 1)
        XCTAssertEqual(presenterMock.delegateWantsToLoginLastLogin, "")
        XCTAssertEqual(presenterMock.delegateWantsToLoginLastPass, "")
    }

    func testLoginActionWithValidData() {
        // Given
        viewController.loginTextField?.text = "Ragnar"
        viewController.passTextField?.text = "Vikings"

        // When
        viewController.loginButtonAction(sender: viewController.loginButton!)

        // Then
        XCTAssertEqual(presenterMock.delegateWantsToLoginCalls, 1)
        XCTAssertEqual(presenterMock.delegateWantsToLoginLastLogin, "Ragnar")
        XCTAssertEqual(presenterMock.delegateWantsToLoginLastPass, "Vikings")
    }

    func testLoginError() {
        // Given
        // Initial data

        // When
        viewController.showLoginError(true)

        // Then
        XCTAssertFalse(viewController.errorLabel!.isHidden)

        // When
        viewController.showLoginError(false)

        // Then
        XCTAssertTrue(viewController.errorLabel!.isHidden)
    }

    func testLoading() {
        // Given
        // Initial data

        // When
        viewController.showLoading(true)

        // Then
        XCTAssertTrue(viewController.activityIndicatorView.isAnimating)

        // When
        viewController.showLoading(false)

        // Then
        XCTAssertFalse(viewController.activityIndicatorView.isAnimating)
    }

}

private class LoginPresenterMock: LoginPresenter {

    var delegateWantsToLoginCalls = 0
    var delegateWantsToLoginLastLogin: String?
    var delegateWantsToLoginLastPass: String?
    override func delegateWantsToLogin(login: String, pass: String) {
        delegateWantsToLoginCalls += 1
        delegateWantsToLoginLastLogin = login
        delegateWantsToLoginLastPass = pass
    }
    
}
