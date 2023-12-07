//
//  QRScannerInterface.swift
//  Shared
//
//  Created by Andy ⠀ on 07/12/23.
//

import Foundation

public protocol QRScannerInterface {
    var qrCodeCompletion: ((_ code: String) -> Void)? { get set }
}
