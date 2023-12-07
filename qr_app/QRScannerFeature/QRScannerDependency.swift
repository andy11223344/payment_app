//
//  QRScannerDependency.swift
//  QRScannerFeature
//
//  Created by Andy ⠀ on 07/12/23.
//

import Foundation
import Shared

public class QRScannerDependency: QRScannerInterface {
    public var qrCodeCompletion: ((String) -> Void)?
    
    public init(){}
}
