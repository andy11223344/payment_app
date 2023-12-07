//
//  PaymentPresenter.swift
//  PaymentFeature
///Users/andy/Library/Developer/Xcode/Templates/VIPER Module_V2.xctemplate/PaymentPresenterViewController.swift
//  Created by Andy ⠀ on 07/12/23.
//  
//

import Foundation
import Models
import Common

class PaymentPresenter {

    var view: PaymentView?
    var interactor: PaymentUseCase?
    var router: PaymentWireframe?
    
    var id: String {
        "Transaction ID: \(data.id)"
    }
    
    var bankName: String {
        "Bank: \(data.bankName)"
    }
    
    var merchant: String {
        "Merchant: \(data.merchant)"
    }
    
    var amount: String {
        "Amount: \(data.amount.toCurrency)"
    }
    
    let data: TransactionModel
    
    init(data: TransactionModel) {
        self.data = data
    }
}

extension PaymentPresenter: PaymentPresentation {
    
    func makePayment() {
        interactor?.makePayment(data: data)
    }
}


extension PaymentPresenter: PaymentInteractorOutput {
    func paymentDidSuccess() {
        view?.paymentDidSuccess()
    }
    
    func paymentDidFail(error: String) {
        view?.paymentDidFail(message: error)
    }

}
