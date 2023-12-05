//
//  HomeContract.swift
//  HomeFeature
//
//  Created by Andy ⠀ on 05/12/23.
//  
//

import UIKit
import RouterServiceInterface

// MARK: - ViewController
protocol HomeView: AnyObject {
    var presenter: HomePresentation? { get set }
    
}

// MARK: - Presenter
protocol HomePresentation: AnyObject {
    
    var view: HomeView? { get set }
    var interactor: HomeUseCase? { get set }
    var router: HomeWireframe? { get set }
}


// MARK: - Interactor
protocol HomeUseCase: AnyObject {
    var presenter: HomeInteractorOutput? { get set }
}


// MARK: - Interactor Output
protocol HomeInteractorOutput: AnyObject {
    
}

// MARK: - Router
protocol HomeWireframe: AnyObject {
    var view: UIViewController? { get set }
    var routerService: RouterServiceProtocol? { get set }
}
