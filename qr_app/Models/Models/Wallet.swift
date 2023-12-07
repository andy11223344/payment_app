//
//  Wallet.swift
//  Models
//
//  Created by Andy ⠀ on 05/12/23.
//

import UIKit

public struct Wallet: Codable {
    public var balance: Double
    public var transactionHistory: [TransactionHistory]?
    
    public init(balance: Double) {
        self.balance = balance
        self.transactionHistory = nil
    }
    
    public init(balance: Double, transactionHistory: [TransactionHistory]?) {
        self.balance = balance
        self.transactionHistory = transactionHistory
    }
}

public struct TransactionHistory: Codable {
    public let id: String
    public let bankName: String
    public let merchant: String
    public let amount: Double
    public let date: Date
    
    public init(id: String, bankName: String, merchant: String, amount: Double, date: Date) {
        self.id = id
        self.bankName = bankName
        self.merchant = merchant
        self.amount = amount
        self.date = date
    }
}
