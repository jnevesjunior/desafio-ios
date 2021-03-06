//
//  TransactionStatusView.swift
//  SampleBankApp
//
//  Created by José Neves on 09/03/21.
//

import UIKit


class TransactionStatusView: UIView {

    var iconImageView: UIImageView?

    var titleLabel: UILabel?
    var statusLabel: UILabel?

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor = .systemBackground

        self.addIconImageView()

        self.addTitleLabel()
        self.addStatusLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStatus(_ status: Bool) {
        self.statusLabel?.text = status ? "Pago" : "Cancelado"
        self.statusLabel?.textColor = status ? .green : .red
    }

    private func addIconImageView() {
        let imageView = UIImageView(image: UIImage(named: "Clock"))
        imageView.tintColor = .sbaTertiary

        self.addSubview(imageView)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: imageView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .width,
                           multiplier: 1,
                           constant: 20).isActive = true
        NSLayoutConstraint(item: imageView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .height,
                           multiplier: 1,
                           constant: 20).isActive = true
        NSLayoutConstraint(item: imageView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .top,
                           multiplier: 1,
                           constant: 25).isActive = true
        NSLayoutConstraint(item: imageView,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 25).isActive = true

        self.iconImageView = imageView
    }

    private func addTitleLabel() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        label.text = "Status"
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = .lightGray

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
                           constant: 26).isActive = true

        self.titleLabel = label
    }

    private func addStatusLabel() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 60))
        label.text = "Pago"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .label

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
                           constant: 26).isActive = true

        self.statusLabel = label
    }
}
