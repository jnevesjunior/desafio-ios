//
//  ViewController.swift
//  SampleBankApp
//
//  Created by José Neves on 04/03/21.
//

import UIKit
import MaterialComponents.MaterialTextControls_OutlinedTextFields
import MaterialComponents.MaterialButtons


class LoginViewController: UIViewController {

    var loginTextField: MDCOutlinedTextField?
    var passTextField: MDCOutlinedTextField?
    var loginButton: MDCButton?
    var resetPassButton: UIButton?

    // MARK: - UIViewController lifecycle

    override func loadView() {
        super.loadView()

        self.view.backgroundColor = .sbaPrimary

        self.addLogoImg()

        self.addLoginTextField()

        self.addPassTextField()

        self.addResetPassButton()
        self.addLoginButton()

        self.addDelegates()

        loginButton?.addTarget(self, action: #selector(self.goToWallet), for: .touchUpInside)

    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        goToWallet(sender: loginButton)
//    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    // MARK: - Actions

    @objc func goToWallet(sender: Any) {
        let viewController = WalletViewController()
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .crossDissolve

        self.present(viewController, animated: true, completion: nil)
    }

    // MARK: - Private methods

    private func addLogoImg() {
        let logoImageView = UIImageView(image: UIImage(named: "Logo"))
        self.view.addSubview(logoImageView)

        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: logoImageView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: self.view,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: logoImageView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .topMargin,
                           multiplier: 1,
                           constant: 50).isActive = true
    }

    private func addLoginTextField() {
        let estimatedFrame = CGRect(x: 0, y: 0, width: 100, height: 55)
        let textField = MDCOutlinedTextField(frame: estimatedFrame)
        textField.label.text = "Nome ou email"
        textField.sizeToFit()
        textField.applySBATheme()

        textField.setLeadingIcon(UIImage(named: "Person")!)

        self.view.addSubview(textField)

        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: textField,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 20).isActive = true
        NSLayoutConstraint(item: textField,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -20).isActive = true
        NSLayoutConstraint(item: textField,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .topMargin,
                           multiplier: 1,
                           constant: 200).isActive = true

        loginTextField = textField
        loginTextField?.resignFirstResponder()
    }

    private func addPassTextField() {
        let estimatedFrame = CGRect(x: 0, y: 0, width: 100, height: 55)
        let textField = MDCOutlinedTextField(frame: estimatedFrame)
        textField.label.text = "Senha"
        textField.isSecureTextEntry = true
        textField.sizeToFit()
        textField.applySBATheme()

        textField.setLeadingIcon(UIImage(named: "Padlock")!)

        self.view.addSubview(textField)

        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: textField,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 20).isActive = true
        NSLayoutConstraint(item: textField,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -20).isActive = true
        NSLayoutConstraint(item: textField,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self.loginTextField!,
                           attribute: .bottomMargin,
                           multiplier: 1,
                           constant: 30).isActive = true

        passTextField = textField
    }

    private func addLoginButton() {
        let button = MDCButton()
        button.minimumSize = CGSize(width: 100, height: 55)
        button.applySBATheme()
        button.setTitle("Acessar minha conta", for: .normal)

        self.view.addSubview(button)

        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: button,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 20).isActive = true
        NSLayoutConstraint(item: button,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -20).isActive = true
        NSLayoutConstraint(item: button,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: resetPassButton!,
                           attribute: .topMargin,
                           multiplier: 1,
                           constant: -30).isActive = true

        self.loginButton = button
    }

    private func addResetPassButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        button.setTitle("Esqueci minha senha", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .thin)

        self.view.addSubview(button)

        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: button,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 20).isActive = true
        NSLayoutConstraint(item: button,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -20).isActive = true
        NSLayoutConstraint(item: button,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .bottomMargin,
                           multiplier: 1,
                           constant: -20).isActive = true

        self.resetPassButton = button
    }

    private func addDelegates() {
        self.loginTextField?.delegate = self
        self.passTextField?.delegate = self
    }

}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

