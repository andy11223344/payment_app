//
//  PaymentError.swift
//  WalletServices
//
//  Created by Andy ⠀ on 05/12/23.
//

import Foundation

public enum PaymentError: Error {
    case insufficientBalance
}


extension PaymentError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .insufficientBalance:
            return "Not enough balance"
        }
    }
}
