//
//  MenuFeatures.swift
//  HomeFeature
//
//  Created by Andy ⠀ on 06/12/23.
//

import UIKit
import RouterServiceInterface
import NavigationRoute

struct MenuFeature {
    let image: UIImage?
    let title: String
    let navigationRoute: Route?
}

extension MenuFeature {
    static let list: [MenuFeature] = [
        MenuFeature(image: UIImage.ex.payment, 
                    title: "Payment",
                    navigationRoute: QRScannerRoute()),
        
        MenuFeature(image: UIImage.ex.history, 
                    title: "Transaction History",
                    navigationRoute: TransactionHistoryRoute()),
    ]
}


