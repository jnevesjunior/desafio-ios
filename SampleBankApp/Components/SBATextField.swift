//
//  SBATextField.swift
//  SampleBankApp
//
//  Created by José Neves on 05/03/21.
//

import UIKit
import MaterialComponents.MaterialTextControls_OutlinedTextFields
import MaterialComponents.MaterialTextControls_OutlinedTextFieldsTheming


extension MDCOutlinedTextField {
    func applySBATheme() {
        self.containerRadius = 15
        self.setTextColor(.white, for: .normal)
        self.setTextColor(.white, for: .editing)
        
        self.setFloatingLabelColor(.lightGray, for: .normal)
        self.setFloatingLabelColor(.lightGray, for: .editing)
        
        self.setNormalLabelColor(.lightGray, for: .normal)
        self.setNormalLabelColor(.lightGray, for: .editing)
        
        let secondaryColor = UIColor(named: "Secondary")!
        self.setOutlineColor(secondaryColor, for: .normal)
        self.setOutlineColor(secondaryColor, for: .editing)
    }
    
    func setLeadingIcon(_ icon: UIImage) {
        let personIconView = UIImageView(image: icon.withRenderingMode(.alwaysTemplate))
        personIconView.tintColor = .white
        
        self.leadingView = personIconView
        self.leadingViewMode = .always
    }
}
