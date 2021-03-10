//
//  TransactionView.swift
//  SampleBankApp
//
//  Created by José Neves on 09/03/21.
//

import UIKit


class TransactionView: UIView {
    
    var iconImageView: UIImageView?
    
    var valueLabel: UILabel?
    var descLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .systemBackground
        
        self.addIconImageView()
        
        self.addValueLabel()
        self.addDescLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addIconImageView() {
        let imageView = UIImageView(image: UIImage(named: "WalletIcon"))

        self.addSubview(imageView)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: imageView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .width,
                           multiplier: 1,
                           constant: 40).isActive = true
        NSLayoutConstraint(item: imageView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .height,
                           multiplier: 1,
                           constant: 40).isActive = true
        NSLayoutConstraint(item: imageView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .top,
                           multiplier: 1,
                           constant: 15).isActive = true
        NSLayoutConstraint(item: imageView,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 15).isActive = true

        self.iconImageView = imageView
    }
    
    private func addValueLabel() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        label.text = "R$00,00"
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = .black

        self.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: label,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .top,
                           multiplier: 1,
                           constant: 15).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self.iconImageView,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: 16).isActive = true

        self.valueLabel = label
    }
    
    private func addDescLabel() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 60))
        label.text = "Cartão de crédito"
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = .lightGray

        self.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: label,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: -15).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self.iconImageView,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: 16).isActive = true

        self.descLabel = label
    }
}
