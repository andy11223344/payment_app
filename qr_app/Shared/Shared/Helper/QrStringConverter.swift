//
//  QrStringConverter.swift
//  Shared
//
//  Created by Andy ⠀ on 07/12/23.
//

import UIKit
import Models

public enum QRConverterError: Error {
    case qrStringError
}

extension QRConverterError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .qrStringError:
            return "Invalid QR code"
        }
    }
}

public class QrStringConverter {
    
    let qr: String
    
    public init(qrString: String) {
        self.qr = qrString
    }
    
    public func convertToTransactionModel() -> Result<TransactionModel, QRConverterError> {
        let arrString = qr.components(separatedBy: ".")
        if arrString.count != 4 { return .failure(.qrStringError) }
        
        let bankName = arrString[0]
        let transId = arrString[1]
        let merchant = arrString[2]
        let amount = arrString[3]
        
        let data = TransactionModel(bankName: bankName, id: transId, merchant: merchant, amount: Double(amount) ?? 0)
        
        return .success(data)
    }
}
