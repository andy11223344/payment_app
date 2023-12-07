//
//  WalletServiceInterface.swift
//  WalletServices
//
//  Created by Andy ⠀ on 05/12/23.
//

import Foundation
import Models

public protocol WalletServiceInterface {
    var balance: Double { get }
    var transactionHistory: [TransactionHistory]? { get }
    func makePayment(data: TransactionModel) throws
    func updateBalance(amount: Double)
    func clearHistory()
    func paymentDidCreatedObserver(completion: @escaping ((_ data: TransactionModel) -> Void))
}
