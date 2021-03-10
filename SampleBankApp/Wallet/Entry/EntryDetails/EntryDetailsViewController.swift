//
//  EntryDetailsViewController.swift
//  SampleBankApp
//
//  Created by José Neves on 09/03/21.
//

import UIKit


class EntryDetailsViewController: UIViewController {

    var detailsStackView: UIStackView?

    var transactionView: TransactionView?
    var buyerNameView: BuyerNameView?
    var buyerEmailView: BuyerEmailView?
    var transactionDateView: TransactionDateView?
    var transactionStatusView: TransactionStatusView?

    // MARK: - UIViewController lifecycle

    override func loadView() {
        super.loadView()

        self.view.backgroundColor = .secondarySystemBackground

        self.addBackButton()

        self.addDetailsContainer()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.showTransaction()
        self.showBuyerName()
        self.showBuyerEmail()
        self.showTransactionDate()
        self.showTransactionStatus()
    }

    private func addBackButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        button.setTitle("Voltar", for: .normal)
        button.setTitleColor(.sbaAccent, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)

        self.view.addSubview(button)

        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: button,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .topMargin,
                           multiplier: 1,
                           constant: 12).isActive = true
        NSLayoutConstraint(item: button,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .leadingMargin,
                           multiplier: 1,
                           constant: 12).isActive = true
    }

    private func addDetailsContainer() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.backgroundColor = .systemBackground

        self.view.addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: stackView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: self.view,
                           attribute: .width,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: stackView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self.view,
                           attribute: .topMargin,
                           multiplier: 1,
                           constant: 50).isActive = true

        self.detailsStackView = stackView

    }

    private func showTransaction() {
        if self.transactionView == nil {
            let view = TransactionView()
            view.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
            view.heightAnchor.constraint(equalToConstant: 70.0).isActive = true

            self.detailsStackView?.addArrangedSubview(view)

            self.transactionView = view
        }
    }

    private func showBuyerName() {
        if self.buyerNameView == nil {
            let view = BuyerNameView()
            view.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
            view.heightAnchor.constraint(equalToConstant: 70.0).isActive = true

            self.detailsStackView?.addArrangedSubview(view)

            self.buyerNameView = view
        }
    }

    private func showBuyerEmail() {
        if self.buyerEmailView == nil {
            let view = BuyerEmailView()
            view.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
            view.heightAnchor.constraint(equalToConstant: 70.0).isActive = true

            self.detailsStackView?.addArrangedSubview(view)

            self.buyerEmailView = view
        }
    }

    private func showTransactionDate() {
        if self.transactionDateView == nil {
            let view = TransactionDateView()
            view.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
            view.heightAnchor.constraint(equalToConstant: 70.0).isActive = true

            self.detailsStackView?.addArrangedSubview(view)

            self.transactionDateView = view
        }
    }

    private func showTransactionStatus() {
        if self.transactionStatusView == nil {
            let view = TransactionStatusView()
            view.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
            view.heightAnchor.constraint(equalToConstant: 70.0).isActive = true

            self.detailsStackView?.addArrangedSubview(view)

            self.transactionStatusView = view
        }
    }
}
