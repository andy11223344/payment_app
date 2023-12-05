//
//  HomeRouter.swift
//  HomeFeature
//
//  Created by Andy ⠀ on 05/12/23.
//  
//

import UIKit
import RouterServiceInterface

public class HomeRouter  {
    
    weak var view: UIViewController?
    
    var routerService: RouterServiceProtocol?
    
    // MARK: Static methods
    static func createModule(routerService: RouterServiceProtocol) -> UIViewController {
        
        let presenter: HomePresentation & HomeInteractorOutput = HomePresenter()
        let view: UIViewController & HomeView = HomeViewController()
        let interactor: HomeUseCase = HomeInteractor()
        let router: HomeWireframe = HomeRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.view = view
        
        router.routerService = routerService
        
        return view
    }
    
}

extension HomeRouter: HomeWireframe {
    
}
