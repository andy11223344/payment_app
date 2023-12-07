//
//  QRModel.swift
//  Models
//
//  Created by Andy ⠀ on 06/12/23.
//

import Foundation

public struct TransactionModel: Codable {
    public let bankName: String
    public let id: String
    public let merchant: String
    public let amount: Double
    
    public init(bankName: String, id: String, merchant: String, amount: Double) {
        self.bankName = bankName
        self.id = id
        self.merchant = merchant
        self.amount = amount
    }
}
