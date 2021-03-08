//
//  ViewController.swift
//  SampleBankApp
//
//  Created by José Neves on 04/03/21.
//

import UIKit
import MaterialComponents.MaterialTextControls_OutlinedTextFields
import MaterialComponents.MaterialTextControls_OutlinedTextFieldsTheming

class LoginViewController: UIViewController {
    
    var loginTextField: MDCOutlinedTextField?
    var passTextField: MDCOutlinedTextField?

    override func loadView() {
        super.loadView()

        self.view.backgroundColor = UIColor(named: "Primary")

        
        self.addLogoImg()

        self.addLoginTextField()
        self.addPassTextField()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
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

}

