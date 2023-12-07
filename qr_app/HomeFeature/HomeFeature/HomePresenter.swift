//
//  HomePresenter.swift
//  HomeFeature
///Users/andy/Library/Developer/Xcode/Templates/VIPER Module_V2.xctemplate/HomePresenterViewController.swift
//  Created by Andy ⠀ on 05/12/23.
//  
//

import Foundation
import AuthService
import RouterServiceInterface
import Shared
import Common

class HomePresenter {

    var view: HomeView?
    var interactor: HomeUseCase?
    var router: HomeWireframe?
    
    var qrInterface: QRScannerInterface?
    
    let menuList = MenuFeature.list
    
    var menuCount: Int { menuList.count }
    
    var username: String {
        return Auth.current.user?.username ?? ""
    }
    
    var balance: String {
        let balance = interactor?.wallet.balance ?? 0
        return "Balance: \(balance.toCurrency)"
    }
    
    init() {
       
    }
}

extension HomePresenter: HomePresentation {
    
    func mainMenu(_ index: Int) -> MenuFeature {
        return menuList[index]
    }
   
    func updateBalance(text: String?) {
        interactor?.updateBalance(amount: text)
    }
    
    func openPage(menuIndex: Int) {
        guard let route = menuList[menuIndex].navigationRoute else { return }
        self.router?.navigateTo(route: route)
    }
}

extension HomePresenter: HomeInteractorOutput {
    func reloadData() {
        view?.reloadViewData()
    }
    
    func updateBalanceDidSuccess() {
        view?.reloadViewData()
    }
    
    func updateBalanceDidFail(message: String) {
        view?.showAlert(message: message)
    }
}
