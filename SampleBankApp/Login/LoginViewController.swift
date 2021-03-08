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

    override func loadView() {
        super.loadView()

        self.view.backgroundColor = UIColor(named: "Primary")

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


        let estimatedFrame = CGRect(x: 0, y: 0, width: 100, height: 55)
        let phoneTextField = MDCOutlinedTextField(frame: estimatedFrame)
        phoneTextField.label.text = "Nome ou email"
        phoneTextField.sizeToFit()
        phoneTextField.applySBATheme()
        
        phoneTextField.setLeadingIcon(UIImage(named: "Person")!)
        
        self.view.addSubview(phoneTextField)

        phoneTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: phoneTextField,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 20).isActive = true
        NSLayoutConstraint(item: phoneTextField,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -20).isActive = true
        NSLayoutConstraint(item: phoneTextField,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .topMargin,
                           multiplier: 1,
                           constant: 200).isActive = true
        
        let passTextField = MDCOutlinedTextField(frame: estimatedFrame)
        passTextField.label.text = "Senha"
        passTextField.isSecureTextEntry = true
        passTextField.sizeToFit()
        passTextField.applySBATheme()
        
        passTextField.setLeadingIcon(UIImage(named: "Padlock")!)
        
        self.view.addSubview(passTextField)

        passTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: passTextField,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 20).isActive = true
        NSLayoutConstraint(item: passTextField,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -20).isActive = true
        NSLayoutConstraint(item: passTextField,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: phoneTextField,
                           attribute: .bottomMargin,
                           multiplier: 1,
                           constant: 30).isActive = true


    }

    override func viewDidLoad() {
        super.viewDidLoad()


    }


}

