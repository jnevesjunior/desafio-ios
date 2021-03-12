//
//  ViewController.swift
//  SampleBankApp
//
//  Created by José Neves on 04/03/21.
//

import UIKit
import MaterialComponents.MaterialTextControls_OutlinedTextFields
import MaterialComponents.MaterialButtons
import NVActivityIndicatorView


class LoginViewController: UIViewController {

    var logoImageView: UIImageView?
    var loginTextField: MDCOutlinedTextField?
    var passTextField: MDCOutlinedTextField?
    var errorLabel: UILabel?
    var loginButton: MDCButton?
    var resetPassButton: UIButton?

    var activityIndicatorView: NVActivityIndicatorView!

    var presenter: LoginPresenter?

    // MARK: - UIViewController lifecycle

    override func loadView() {
        super.loadView()

        self.view.backgroundColor = .sbaPrimary

        self.addLogoImg()

        self.addLoginTextField()
        self.addPassTextField()

        self.addErrorLabel()

        self.addResetPassButton()
        self.addLoginButton()

        self.addDelegates()

        self.presenter = LoginPresenter.defaultPresenter()
        self.presenter?.delegate = self

        loginButton?.addTarget(self, action: #selector(self.loginButtonAction), for: .touchUpInside)

        self.activityIndicatorView = NVActivityIndicatorView(frame: CGRect(x: (self.view.frame.width / 2) - 25,
                                                                           y: (self.view.frame.height / 2) - 25,
                                                                           width: 50,
                                                                           height: 50),
                                                             type: .ballPulse,
                                                             color: NVActivityIndicatorView.DEFAULT_COLOR,
                                                             padding: NVActivityIndicatorView.DEFAULT_PADDING)
        self.view.addSubview(self.activityIndicatorView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setNeedsStatusBarAppearanceUpdate()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
            .lightContent
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        goToWallet()
    }

    // MARK: - Actions

    @objc func loginButtonAction(sender: Any) {
        let login = loginTextField?.text ?? ""
        let pass = passTextField?.text ?? ""

        presenter?.delegateWantsToLogin(login: login, pass: pass)
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
        NSLayoutConstraint(item: logoImageView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .height,
                           multiplier: 1,
                           constant: 120).isActive = true
        self.logoImageView = logoImageView
    }

    private func addLoginTextField() {
        let estimatedFrame = CGRect(x: 0, y: 0, width: 100, height: 55)
        let textField = MDCOutlinedTextField(frame: estimatedFrame)
        textField.label.text = "Nome ou email"
        textField.autocapitalizationType = .none
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
        textField.autocapitalizationType = .none
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

        self.passTextField = textField
    }

    private func addErrorLabel() {
        let label = UILabel()
        label.text = "Usuário ou senha inválidos"
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.textColor = .sbaAccent
        label.textAlignment = .center
        label.isHidden = true

        self.view.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: label,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .height,
                           multiplier: 1,
                           constant: 20).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 20).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -20).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self.passTextField!,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 16).isActive = true

        self.errorLabel = label
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

    private func goToWallet() {
        let viewController = WalletViewController()
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .crossDissolve

        self.present(viewController, animated: true, completion: nil)
    }

}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension LoginViewController: LoginPresenterDelegate {

    func showLoading(_ isLoading: Bool) {
        if isLoading {
            activityIndicatorView.startAnimating()
        } else {
            activityIndicatorView.stopAnimating()
        }
    }

    func showLoginError(_ isError: Bool) {
        self.errorLabel?.isHidden = !isError
    }
    
    func loginSuccess() {
        goToWallet()
    }
}
