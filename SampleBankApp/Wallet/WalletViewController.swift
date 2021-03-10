//
//  WalletViewController.swift
//  SampleBankApp
//
//  Created by José Neves on 08/03/21.
//

import UIKit


class WalletViewController: UIViewController {

    var iconImageView: UIImageView?
    var titleLabel: UILabel?
    var infoLabel: UILabel?
    
    var containerView: UIView?
    var entriesTableView: UITableView?

    // MARK: - UIViewController lifecycle

    override func loadView() {
        super.loadView()

        self.view.backgroundColor = .sbaPrimary

        self.addIconImg()
        self.addWelcomeLabel()
        self.addTitleLabel()
        self.addInfoLabel()
        
        self.addContainerView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Private methods

    private func addIconImg() {
        let imageView = UIImageView(image: UIImage(named: "Icon"))
        self.view.addSubview(imageView)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: imageView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .width,
                           multiplier: 1,
                           constant: 60).isActive = true
        NSLayoutConstraint(item: imageView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .height,
                           multiplier: 1,
                           constant: 60).isActive = true
        NSLayoutConstraint(item: imageView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .topMargin,
                           multiplier: 1,
                           constant: 20).isActive = true
        NSLayoutConstraint(item: imageView,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 20).isActive = true

        self.iconImageView = imageView
    }

    private func addWelcomeLabel() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 60))
        label.text = "Olá, Qwerty"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .right
        label.textColor = .white

        self.view.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: label,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .height,
                           multiplier: 1,
                           constant: 60).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .topMargin,
                           multiplier: 1,
                           constant: 20).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -30).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self.iconImageView,
                           attribute: .trailingMargin,
                           multiplier: 1,
                           constant: 20).isActive = true
    }
    
    private func addTitleLabel() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 60))
        label.text = "Pedidos"
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.textColor = .white

        self.view.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: label,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self.iconImageView,
                           attribute: .bottomMargin,
                           multiplier: 1,
                           constant: 30).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .leadingMargin,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        self.titleLabel = label
    }
    
    private func addInfoLabel() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 60))
        label.text = "xxx pedidos, totalizando R$"
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = .lightGray

        self.view.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: label,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self.titleLabel,
                           attribute: .bottomMargin,
                           multiplier: 1,
                           constant: 16).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .leadingMargin,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .trailingMargin,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        self.infoLabel = label
    }
    
    // To do: Maybe this container is unnecessary
    private func addContainerView() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 10))
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 15
        
        self.view.addSubview(view)

        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: view,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: self.view,
                           attribute: .width,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: view,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self.infoLabel,
                           attribute: .bottomMargin,
                           multiplier: 1,
                           constant: 35).isActive = true
        NSLayoutConstraint(item: view,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: self.view,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 16).isActive = true
        
        self.containerView = view
        self.addEntriesTableView()
    }
    
    private func addEntriesTableView() {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        tableView.layer.cornerRadius = 15
        tableView.separatorStyle = .none
        
        self.view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: tableView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: self.containerView,
                           attribute: .width,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: tableView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self.containerView,
                           attribute: .top,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: tableView,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: self.containerView,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 16).isActive = true
        
        self.entriesTableView = tableView
        
        self.entriesTableView?.register(EntryTableViewCell.self, forCellReuseIdentifier: EntryTableViewCell.reuseIdentifier)
        self.entriesTableView?.delegate = self
        self.entriesTableView?.dataSource = self
    }
}

extension WalletViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return EntryTableViewCell.estimatedHeight
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return EntryTableViewCell.estimatedHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let viewController = EntryDetailsViewController()

            self.present(viewController, animated: true, completion: nil)
    }
}

extension WalletViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return EntryTableViewCell.dequeueReusableCell(tableView: tableView)
    }
}
