//
//  TransactionHistoryFeatureRouter.swift
//  TransactionHistoryFeature
//
//  Created by Andy ⠀ on 06/12/23.
//  
//

import UIKit
import RouterServiceInterface
import WalletServices

public class TransactionHistoryFeatureRouter  {
    
    weak var view: UIViewController?
    
    // MARK: Static methods
    static func createModule(wallet: WalletServiceInterface) -> UIViewController {
        
        let presenter: TransactionHistoryFeaturePresentation & TransactionHistoryFeatureInteractorOutput = TransactionHistoryFeaturePresenter(wallet: wallet)
        let view: UIViewController & TransactionHistoryFeatureView = TransactionHistoryFeatureViewController(presenter: presenter)
        let interactor: TransactionHistoryFeatureUseCase = TransactionHistoryFeatureInteractor()
        let router: TransactionHistoryFeatureWireframe = TransactionHistoryFeatureRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
    
}

extension TransactionHistoryFeatureRouter: TransactionHistoryFeatureWireframe {
    
}
