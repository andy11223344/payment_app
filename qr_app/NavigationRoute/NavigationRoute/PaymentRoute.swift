//
//  PaymentRoute.swift
//  NavigationRoute
//
//  Created by Andy ⠀ on 07/12/23.
//

import Foundation
import RouterServiceInterface
import Models

public struct PaymentRoute: Route {
    public static let identifier: String = "payment"
    
    public let data: TransactionModel
    public init(data: TransactionModel) {
        self.data = data
    }
}

