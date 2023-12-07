//
//  Double+Ext.swift
//  Common
//
//  Created by Andy ⠀ on 07/12/23.
//

import Foundation

public extension Double {
    
    var toCurrency: String {
        let amount = self
        let currencyFormatter = NumberFormatter()
        currencyFormatter.currencyGroupingSeparator = ","
        currencyFormatter.numberStyle = .currency
        currencyFormatter.maximumFractionDigits = 0
        currencyFormatter.currencySymbol = "IDR"
        return currencyFormatter.string(from: NSNumber(value: amount)) ?? ""
    }
    
}
