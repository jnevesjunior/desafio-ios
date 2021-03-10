//
//  DetailLineView.swift
//  SampleBankApp
//
//  Created by José Neves on 10/03/21.
//

import UIKit


class DetailLineView: UIView {
    var label: String!
    var currency: String!
    var value: Float!
    var color: UIColor!
    
    
    var labelLabel: UILabel!
    var currencyLabel: UILabel!
    var valueLabel: UILabel!

    convenience init(label: String, currency: String, value: Float, color: UIColor) {
        self.init(frame: CGRect.zero)
        
        self.label = label
        self.currency = currency
        self.value = value
        self.color = color
        
        self.addLabel()
        self.addCurrency()
        self.addValue()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addLabel() {
        let label = UILabel()
        label.text = self.label
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = self.color

        self.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: label,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .top,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .trailing,
                           multiplier: 0.7,
                           constant: 0).isActive = true
        
        self.labelLabel = label
    }
    
    private func addCurrency() {
        let label = UILabel()
        label.text = self.currency
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = self.color

        self.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: label,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .top,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self.labelLabel,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .width,
                           multiplier: 1,
                           constant: 20).isActive = true
        
        self.currencyLabel = label
    }
    
    private func addValue() {
        let label = UILabel()
        label.text = "\(self.value ?? 0)"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = self.color
        label.textAlignment = .right

        self.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: label,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .top,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self.currencyLabel,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        self.valueLabel = label
    }

}
