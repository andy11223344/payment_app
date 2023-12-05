//
//  HomeRouter.swift
//  HomeFeature
//
//  Created by Andy ⠀ on 05/12/23.
//  
//

import UIKit

public class HomeRouter  {
    
    weak var view: UIViewController?
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
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
        
        return view
    }
    
}

extension HomeRouter: HomeWireframe {
    
}
