//
//  EntryTableViewCell.swift
//  SampleBankApp
//
//  Created by José Neves on 09/03/21.
//

import UIKit


class EntryTableViewCell: UITableViewCell {

    static let reuseIdentifier = "EntryTableViewCell"
    static var estimatedHeight: CGFloat = 80

    var iconImageView: UIImageView?

    var valueLabel: UILabel?
    var emailLabel: UILabel?

    var statusLabel: UILabel?
    var dateLabel: UILabel?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.selectionStyle = .none
        self.addIconImageView()

        self.addValueLabel()
        self.addEmailLabel()

        self.addStatusLabel()
        self.addDateLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    static func dequeueReusableCell(tableView: UITableView, entry: [String: Any]) -> EntryTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as! EntryTableViewCell
        cell.setEntry(entry)
        
        return cell
    }
    
    func setEntry(_ entry: [String: Any]) {
        if let amount = entry["amount"] as? String {
            self.valueLabel?.text = String(format: "R$ %.02f", Float(amount) ?? 0)
        }
        
        if let email = entry["email"] as? String {
            self.emailLabel?.text = email
        }
        
        if let status = entry["status"] as? Int {
            self.statusLabel?.text = status == 0 ? "Pago" : "Cancelado"
            self.statusLabel?.textColor = status == 0 ? .green : .red
        }
        
        if let createdAt = entry["createdAt"] as? String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

            if let date = dateFormatter.date(from: createdAt) {
                let components = Calendar.current.dateComponents([.day], from: date, to: Date())
                self.dateLabel?.text = "\(components.day ?? 0) dias atras"
            }
        }
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
                           constant: 20).isActive = true
        NSLayoutConstraint(item: imageView,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 20).isActive = true

        self.iconImageView = imageView
    }

    private func addValueLabel() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        label.text = "R$"
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = .label

        self.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: label,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .top,
                           multiplier: 1,
                           constant: 20).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self.iconImageView,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: 16).isActive = true

        self.valueLabel = label
    }
    
    private func addEmailLabel() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 60))
        label.text = "example@example.com"
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
                           constant: -20).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self.iconImageView,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: 16).isActive = true

        self.emailLabel = label
    }

    private func addStatusLabel() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 60))
        label.text = "Status"
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = .green

        self.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: label,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .top,
                           multiplier: 1,
                           constant: 20).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -20).isActive = true
        
        self.statusLabel = label
    }
    
    private func addDateLabel() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 60))
        label.text = "3 dias atras"
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
                           constant: -20).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -20).isActive = true

        self.dateLabel = label
    }

}
