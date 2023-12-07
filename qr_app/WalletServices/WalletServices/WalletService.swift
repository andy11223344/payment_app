//
//  WalletService.swift
//  WalletServices
//
//  Created by Andy ⠀ on 05/12/23.
//

import Foundation
import Models
import Shared
import AuthService

public class WalletService: WalletServiceInterface {
    let user: User
    
    private var wallet: Wallet
    
    private var paymentCreated: ((_ data: TransactionModel) -> Void)?
    
    public var balance: Double { 
        UserPersistents.wallet?.balance ?? 0
    }
    
    public var transactionHistory: [TransactionHistory]? {
        UserPersistents.wallet?.transactionHistory
    }
    
    public init(user: User, wallet: Wallet) {
        self.wallet = wallet
        self.user = user
        
        UserPersistents.wallet = self.wallet
    }
    
    public func makePayment(data: TransactionModel) throws {
        guard balance >= data.amount else {
            throw PaymentError.insufficientBalance
        }
        
        let total = balance - data.amount
        updateBalance(amount: total)
        paymentCreated?(data)
        
        saveHistory(data: data)
    }
    
    public func updateBalance(amount: Double) {
        self.wallet.balance = amount
        UserPersistents.wallet = self.wallet
    }
    
    public func clearHistory() {
        wallet.transactionHistory = nil
        UserPersistents.wallet = wallet
    }
    
    private func saveHistory(data: TransactionModel) {
        var history = wallet.transactionHistory ?? []
        history.append(TransactionHistory(id: data.id, bankName: data.bankName, merchant: data.merchant, amount: data.amount, date: Date()))
        
        wallet.transactionHistory = history
        UserPersistents.wallet = self.wallet
    }
}

//Observe change
extension WalletService {
    public func paymentDidCreatedObserver(completion: @escaping ((_ data: TransactionModel) -> Void)) {
        self.paymentCreated = completion
    }
}

//Static Method
extension WalletService {
    public static var current: Wallet? = UserPersistents.wallet
}
