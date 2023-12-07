//
//  PaymentRouter.swift
//  PaymentFeature
//
//  Created by Andy ⠀ on 07/12/23.
//  
//

import UIKit
import RouterServiceInterface
import WalletServices
import Models

public class PaymentRouter  {
    
    weak var view: UIViewController?
    
    // MARK: Static methods
    static func createModule(data: TransactionModel, wallet: WalletServiceInterface) -> UIViewController {
    
        let presenter: PaymentPresentation & PaymentInteractorOutput = PaymentPresenter(data: data)
        let view: UIViewController & PaymentView = PaymentViewController()
        let interactor: PaymentUseCase = PaymentInteractor(wallet: wallet)
        let router: PaymentWireframe = PaymentRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
    
}

extension PaymentRouter: PaymentWireframe {
   
}
