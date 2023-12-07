//
//  TransactionHistoryFeaturePresenter.swift
//  TransactionHistoryFeature
///Users/andy/Library/Developer/Xcode/Templates/VIPER Module_V2.xctemplate/TransactionHistoryFeaturePresenterViewController.swift
//  Created by Andy ⠀ on 06/12/23.
//  
//

import Foundation
import WalletServices
import Common

class TransactionHistoryFeaturePresenter {

    var view: TransactionHistoryFeatureView?
    var interactor: TransactionHistoryFeatureUseCase?
    var router: TransactionHistoryFeatureWireframe?
    
    let wallet: WalletServiceInterface
    
    var transcationHistoryCount: Int { wallet.transactionHistory?.count ?? 0 }
    
    init(wallet: WalletServiceInterface) {
        self.wallet = wallet
    }
}

extension TransactionHistoryFeaturePresenter: TransactionHistoryFeaturePresentation {
    
    func date(_ index: Int) -> String {
        let date = wallet.transactionHistory?[index].date.toString() ?? ""
        return "Date: \(date)"
    }
    
    func merchant(_ index: Int) -> String {
        return "Merchant: \(wallet.transactionHistory?[index].merchant ?? "")"
    }
    
    func amount(_ index: Int) -> String {
        let amount = wallet.transactionHistory?[index].amount ?? 0
        return "Amount: \(amount.toCurrency)"
    }
    
    func clearHistory() {
        wallet.clearHistory()
        view?.historyDidClear()
    }
    
}


extension TransactionHistoryFeaturePresenter: TransactionHistoryFeatureInteractorOutput {
    
    
}
