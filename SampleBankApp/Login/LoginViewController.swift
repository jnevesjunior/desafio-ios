//
//  ViewController.swift
//  SampleBankApp
//
//  Created by José Neves on 04/03/21.
//

import UIKit

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


    }

    override func viewDidLoad() {
        super.viewDidLoad()


    }


}

