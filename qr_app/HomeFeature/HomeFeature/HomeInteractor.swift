//
//  HomeInteractor.swift
//  HomeFeature
//
//  Created by Andy ⠀ on 05/12/23.
//  
//

import Foundation
import AuthService
import Models
import AuthService
import WalletServices

class HomeInteractor {

    weak var presenter: HomeInteractorOutput?
    let wallet: WalletServiceInterface
    
    init(wallet: WalletServiceInterface) {
        self.wallet = wallet
        
        wallet.paymentDidCreatedObserver { [weak self] _ in
            self?.presenter?.reloadData()
        }
    }
}

extension HomeInteractor: HomeUseCase {
    
    func updateBalance(amount: String?) {
        guard let amount, !amount.isEmpty else {
            presenter?.updateBalanceDidFail(message: "Amount should not empty")
            return
        }
        
        guard let value = Double(amount) else {
            presenter?.updateBalanceDidFail(message: "Invalid amount")
            return
        }
        
        wallet.updateBalance(amount: value)
        presenter?.updateBalanceDidSuccess()
    }
    
}
