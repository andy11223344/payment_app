//
//  QRScannerContract.swift
//  QRScannerFeature
//
//  Created by Andy ⠀ on 07/12/23.
//  
//

import UIKit
import RouterServiceInterface
import Models

// MARK: - ViewController
protocol QRScannerView: AnyObject {
    var presenter: QRScannerPresentation? { get set }
    
    func showAlert(message: String)
}

// MARK: - Presenter
protocol QRScannerPresentation: AnyObject {
    
    var view: QRScannerView? { get set }
    var interactor: QRScannerUseCase? { get set }
    var router: QRScannerWireframe? { get set }
    
    func resolveQRCode(_ qr: String)
}


// MARK: - Interactor
protocol QRScannerUseCase: AnyObject {
    var presenter: QRScannerInteractorOutput? { get set }
}


// MARK: - Interactor Output
protocol QRScannerInteractorOutput: AnyObject {
    
}

// MARK: - Router
protocol QRScannerWireframe: AnyObject {
    var view: UIViewController? { get set }
    
    func routeToPayment(payload: TransactionModel)
    
    func dismiss(animation: Bool)
}
