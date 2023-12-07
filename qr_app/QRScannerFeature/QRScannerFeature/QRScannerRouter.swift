//
//  QRScannerRouter.swift
//  QRScannerFeature
//
//  Created by Andy ⠀ on 07/12/23.
//  
//

import UIKit
import RouterServiceInterface
import Shared
import NavigationRoute
import Models

public class QRScannerRouter  {
    
    weak var view: UIViewController?
    var routerService: RouterServiceProtocol?
    
    // MARK: Static methods
    static func createModule(routerService: RouterServiceProtocol, qrScannerInterface: QRScannerInterface) -> UIViewController {
        
        let presenter: QRScannerPresentation & QRScannerInteractorOutput = QRScannerPresenter(qrScannerInterface: qrScannerInterface)
        let view: UIViewController & QRScannerView = QRScannerViewController()
        let interactor: QRScannerUseCase = QRScannerInteractor()
        let router: QRScannerWireframe = QRScannerRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.view = view
        
        (router as? QRScannerRouter)?.routerService = routerService
        
        return view
    }
    
}

extension QRScannerRouter: QRScannerWireframe {
    func routeToPayment(payload: TransactionModel) {
        guard let view else { return }
        routerService?.navigate(
            toRoute: PaymentRoute(data: payload),
            fromView: view,
            presentationStyle: Modal(),
            animated: true,
            completion: {
                self.dismiss(animation: false)
        })
    }
    
    func dismiss(animation: Bool = true) {
        guard let view else { return }
        view.navigationController?.popViewController(animated: animation)
    }
}
