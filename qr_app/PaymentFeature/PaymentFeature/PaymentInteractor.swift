//
//  PaymentInteractor.swift
//  PaymentFeature
//
//  Created by Andy ⠀ on 07/12/23.
//  
//

import Foundation
import Models
import WalletServices

class PaymentInteractor {

    weak var presenter: PaymentInteractorOutput?
    
    let wallet: WalletServiceInterface
    
    init(wallet: WalletServiceInterface) {
        self.wallet = wallet
    }
}

extension PaymentInteractor: PaymentUseCase {
    func makePayment(data: TransactionModel) {
        do {
            try wallet.makePayment(data: data)
            presenter?.paymentDidSuccess()
        } catch let error as PaymentError {
            presenter?.paymentDidFail(error: error.errorDescription ?? "")
        } catch  {
            presenter?.paymentDidFail(error: "Something went wrong")
        }
    }
    
    
}
