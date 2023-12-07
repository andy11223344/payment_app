//
//  QRScannerPresenter.swift
//  QRScannerFeature
///Users/andy/Library/Developer/Xcode/Templates/VIPER Module_V2.xctemplate/QRScannerPresenterViewController.swift
//  Created by Andy ⠀ on 07/12/23.
//  
//

import Foundation
import Shared
import Models

class QRScannerPresenter {

    var view: QRScannerView?
    var interactor: QRScannerUseCase?
    var router: QRScannerWireframe?
    
    let IQRSCannerInterface: QRScannerInterface
    
    init(qrScannerInterface: QRScannerInterface) {
        self.IQRSCannerInterface = qrScannerInterface
    }
}

extension QRScannerPresenter: QRScannerPresentation {
    func resolveQRCode(_ qr: String) {
        let result = QrStringConverter(qrString: qr).convertToTransactionModel()
        
        switch result {
        case .success(let data):
            router?.routeToPayment(payload: data)
        case .failure(let error):
            view?.showAlert(message: error.errorDescription ?? "")
        }
       
    }
}


extension QRScannerPresenter: QRScannerInteractorOutput {
    
    
}
