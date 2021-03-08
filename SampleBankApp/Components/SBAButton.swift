//
//  SBAButton.swift
//  SampleBankApp
//
//  Created by José Neves on 08/03/21.
//

import UIKit
import MaterialComponents.MaterialButtons

extension MDCButton {

    func applySBATheme() {
        self.backgroundColor = .sbaAccent
        self.layer.cornerRadius = 15
    }
}
