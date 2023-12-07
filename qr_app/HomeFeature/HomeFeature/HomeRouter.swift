//
//  HomeRouter.swift
//  HomeFeature
//
//  Created by Andy ⠀ on 05/12/23.
//  
//

import UIKit
import RouterServiceInterface
import Models
import AuthService
import WalletServices
import NavigationRoute

public class HomeRouter  {
    
    weak var view: UIViewController?
    
    var routerService: RouterServiceProtocol?
    
    // MARK: Static methods
    static func createModule(
        routerService: RouterServiceProtocol,
        wallet: WalletServiceInterface
    ) -> UIViewController {
        
        let presenter: HomePresentation & HomeInteractorOutput = HomePresenter()
        let view: UIViewController & HomeView = HomeViewController(presenter: presenter)
        let interactor: HomeUseCase = HomeInteractor(wallet: wallet)
        let router: HomeWireframe = HomeRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.view = view
        
        (router as? HomeRouter)?.routerService = routerService
        
        return view
    }
    
}

extension HomeRouter: HomeWireframe {
    func navigateTo(route: Route) {
        guard let view else { return }
        
        routerService?.navigate(toRoute: route,
                                fromView: view,
                                presentationStyle: Push(),
                                animated: true)
    }
}
