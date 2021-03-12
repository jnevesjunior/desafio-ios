//
//  EntryDetailsPresenter.swift
//  SampleBankApp
//
//  Created by José Neves on 10/03/21.
//

import Foundation

protocol EntryDetailsPresenterDelegate {
    func setAmount(_ amount: Float)
    func setName(_ name: String)
    func setEmail(_ email: String)
    func setDate(_ date: String)
    func setStatus(_ status: Bool)
    func setTotalAmount(_ amount: Float)
    func setTax(_ tax: Float)
    func setFinalAmount(_ amount: Float)
    func setTransactionHash(_ hash: String)
}

class EntryDetailsPresenter {

    var apiManager: APIManager!
    var delegate: EntryDetailsPresenterDelegate?

    class func defaultPresenter() -> EntryDetailsPresenter {
        return EntryDetailsPresenter(apiManager: APIManager.defaultManager)
    }

    init(apiManager: APIManager!) {
        self.apiManager = apiManager
    }

    func delegateWillAppear() {
        apiManager.entryDetail(delegate: self)
    }

}

extension EntryDetailsPresenter: APIManagerDelegate {

    func returnWithObjects(_ objects: [[String: Any]]) {
        for object in objects {
            if let amount = object["amount"] as? String {
                self.delegate?.setAmount(Float(amount) ?? 0)
            }
            if let name = object["name"] as? String {
                self.delegate?.setName(name)
            }
            if let email = object["email"] as? String {
                self.delegate?.setEmail(email)
            }
            if let createdAt = object["createdAt"] as? String {
                let dateFormatter = DateFormatter()
                dateFormatter.locale = Locale(identifier: "pt_BR")
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"

                if let date = dateFormatter.date(from: createdAt) {
                    let dateFormatterToShow = DateFormatter()
                    dateFormatterToShow.dateFormat = "dd/MM/yyyy"

                    self.delegate?.setDate(dateFormatterToShow.string(from: date))
                }
            }
            if let status = object["status"] as? Int {
                self.delegate?.setStatus(status == 0)
            }
            if let totalAmount = object["totalAmount"] as? String {
                self.delegate?.setTotalAmount(Float(totalAmount) ?? 0)
            }
            if let tax = object["tax"] as? String {
                self.delegate?.setTax(Float(tax) ?? 0)
            }
            if let finalAmount = object["finalAmount"] as? String {
                self.delegate?.setFinalAmount(Float(finalAmount) ?? 0)
            }
            if let transactionHash = object["transactionHash"] as? String {
                self.delegate?.setTransactionHash(transactionHash)
            }
        }
    }

    func returnWithError() {

    }
}
