//
//  PaymentContract.swift
//  PaymentFeature
//
//  Created by Andy ⠀ on 07/12/23.
//  
//

import UIKit
import RouterServiceInterface
import Models

// MARK: - ViewController
protocol PaymentView: AnyObject {
    var presenter: PaymentPresentation? { get set }
    
    func paymentDidSuccess()
    func paymentDidFail(message: String)
    
}

// MARK: - Presenter
protocol PaymentPresentation: AnyObject {
    
    var view: PaymentView? { get set }
    var interactor: PaymentUseCase? { get set }
    var router: PaymentWireframe? { get set }
    
    var id: String { get }
    var bankName: String { get }
    var merchant: String { get }
    var amount: String { get }
    
    func makePayment()
}


// MARK: - Interactor
protocol PaymentUseCase: AnyObject {
    var presenter: PaymentInteractorOutput? { get set }
    
    func makePayment(data: TransactionModel)
}


// MARK: - Interactor Output
protocol PaymentInteractorOutput: AnyObject {
    
    func paymentDidSuccess()
    func paymentDidFail(error: String)
}

// MARK: - Router
protocol PaymentWireframe: AnyObject {
    var view: UIViewController? { get set }
}
