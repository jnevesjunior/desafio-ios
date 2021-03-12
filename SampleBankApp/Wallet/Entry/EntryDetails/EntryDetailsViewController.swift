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

    var financialLabel: UILabel?

    var totalValueView: DetailLineView?
    var taxValueView: DetailLineView?
    var finalValueView: DetailLineView?
    
    var transactionHashLabel: UILabel?

    var presenter: EntryDetailsPresenter?

    // MARK: - UIViewController lifecycle

    override func loadView() {
        super.loadView()

        self.view.backgroundColor = .secondarySystemBackground

        self.addBackButton()

        self.addDetailsContainer()

        self.addFinancialLabel()

        self.addTotalValueView()
        self.addTaxValueView()
        self.addFinalValueView()

        self.addHashView()

        self.presenter = EntryDetailsPresenter.defaultPresenter()
        self.presenter?.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setNeedsStatusBarAppearanceUpdate()
        
        self.presenter?.delegateWillAppear()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
            .lightContent
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

    private func addFinancialLabel() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        label.text = "Resumo financeiro"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray

        self.view.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: label,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self.detailsStackView,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 20).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .height,
                           multiplier: 1,
                           constant: 20).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self.view,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 24).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: self.view,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -24).isActive = true

        self.financialLabel = label
    }

    private func addTotalValueView() {
        let view = DetailLineView(label: "Valor total",
                                  currency: "R$",
                                  value: 0.0,
                                  color: .black)

        self.view.addSubview(view)

        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: view,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .height,
                           multiplier: 1,
                           constant: 25).isActive = true
        NSLayoutConstraint(item: view,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self.financialLabel,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 30).isActive = true
        NSLayoutConstraint(item: view,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self.view,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 24).isActive = true
        NSLayoutConstraint(item: view,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: self.view,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -24).isActive = true

        self.totalValueView = view
    }

    private func addTaxValueView() {
        let view = DetailLineView(label: "Taxas",
                                  currency: "R$",
                                  value: 0.0,
                                  color: .red)

        self.view.addSubview(view)

        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: view,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .height,
                           multiplier: 1,
                           constant: 25).isActive = true
        NSLayoutConstraint(item: view,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self.totalValueView,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: view,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self.view,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 24).isActive = true
        NSLayoutConstraint(item: view,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: self.view,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -24).isActive = true

        self.taxValueView = view
    }

    private func addFinalValueView() {
        let view = DetailLineView(label: "Meu recebimento",
                                  currency: "R$",
                                  value: 0.0,
                                  color: .sbaTertiary)
        view.labelLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        view.currencyLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        view.valueLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)

        self.view.addSubview(view)

        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: view,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .height,
                           multiplier: 1,
                           constant: 25).isActive = true
        NSLayoutConstraint(item: view,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self.taxValueView,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 20).isActive = true
        NSLayoutConstraint(item: view,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self.view,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 24).isActive = true
        NSLayoutConstraint(item: view,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: self.view,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -24).isActive = true

        self.finalValueView = view
    }

    private func addHashView() {
        let view = UIView()
        view.backgroundColor = .systemBackground

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
                           toItem: self.finalValueView,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 20).isActive = true


        let label = UILabel()
        label.text = "sandbox:"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.numberOfLines = 3

        self.view.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: label,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .height,
                           multiplier: 1,
                           constant: 24).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self.view,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 24).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: self.view,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -24).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .top,
                           multiplier: 1,
                           constant: 24).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: -24).isActive = true
        
        self.transactionHashLabel = label
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

extension EntryDetailsViewController: EntryDetailsPresenterDelegate {
    
    func setAmount(_ amount: Float) {
        self.showTransaction()
        self.transactionView?.valueLabel?.text = String(format: "%.02f", amount)
    }
    
    func setName(_ name: String) {
        self.showBuyerName()
        self.buyerNameView?.nameLabel?.text = name
    }
    
    func setEmail(_ email: String) {
        self.showBuyerEmail()
        self.buyerEmailView?.emailLabel?.text = email
    }
    
    func setDate(_ date: String) {
        self.showTransactionDate()
        self.transactionDateView?.dateLabel?.text = date
    }
    
    func setStatus(_ status: Bool) {
        self.showTransactionStatus()
        self.transactionStatusView?.setStatus(status)
    }
    
    func setTotalAmount(_ amount: Float) {
        self.totalValueView?.valueLabel.text = String(format: "%.02f", amount)
    }
    
    func setTax(_ tax: Float) {
        self.taxValueView?.valueLabel.text = String(format: "%.02f", tax)
    }
    
    func setFinalAmount(_ amount: Float) {
        self.finalValueView?.valueLabel.text = String(format: "%.02f", amount)
    }
    
    func setTransactionHash(_ hash: String) {
        self.transactionHashLabel?.text = "sandbox: \(hash)"
    }
}
