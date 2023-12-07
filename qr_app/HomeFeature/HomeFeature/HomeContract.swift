//
//  HomeContract.swift
//  HomeFeature
//
//  Created by Andy ⠀ on 05/12/23.
//  
//

import UIKit
import RouterServiceInterface
import AuthService
import WalletServices

// MARK: - ViewController
protocol HomeView: AnyObject {
    var presenter: HomePresentation { get set }
    
    func reloadViewData()
    func showAlert(message: String)
}

// MARK: - Presenter
protocol HomePresentation: AnyObject {
    
    var view: HomeView? { get set }
    var interactor: HomeUseCase? { get set }
    var router: HomeWireframe? { get set }
    
    var username: String { get }
    var balance: String { get }
    var menuCount: Int { get }
    
    func mainMenu(_ index: Int) -> MenuFeature
    func updateBalance(text: String?)
    func openPage(menuIndex: Int)
}


// MARK: - Interactor
protocol HomeUseCase: AnyObject {
    var presenter: HomeInteractorOutput? { get set }
    
    var wallet: WalletServiceInterface { get }
    
    func updateBalance(amount: String?)
}


// MARK: - Interactor Output
protocol HomeInteractorOutput: AnyObject {
    func updateBalanceDidSuccess()
    func updateBalanceDidFail(message: String)
    func reloadData()
}

// MARK: - Router
protocol HomeWireframe: AnyObject {
    var view: UIViewController? { get set }
    func navigateTo(route: Route)
}
