//
//  AppDelegate.swift
//  qr_app
//
//  Created by Andy ⠀ on 05/12/23.
//

import UIKit
import RouterService
import HomeFeature
import AuthService
import WalletServices
import Models
import Shared
import TransactionHistoryFeature
import PaymentFeature
import QRScannerFeature

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let routerService = RouterService()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //Initialize data
        //Simulate user loggedin
        let user = getUserData()
        Auth.current.loggedIn(user: user)
    
        routerService.register(dependencyFactory: {
            return self.setupWalletService(user: user)
        }, forType: WalletServiceInterface.self)
        
        routerService.register(dependencyFactory: {
            return QRScannerDependency()
        }, forType: QRScannerInterface.self)
        
        routerService.register(routeHandler: TransactionHistoryRouteHandler())
        routerService.register(routeHandler: QRScannerRouteHandler())
        routerService.register(routeHandler: PaymentRouteHandler())
        
        let nav = routerService.navigationController(
            withInitialFeature: HomeFeature.self
        )
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
        return true
    }

    func getUserData() -> User {
        guard let user = Auth.current.user else {
            return User(id: 1, username: "John Doe")
        }
        
        return user
    }
    
    func setupWalletService(user: User) -> WalletService {
        if let current = WalletService.current {
            return WalletService(user: user, wallet: current)
        } else {
            return WalletService(user: user, wallet: Wallet(balance: 70000))
        }
    }

}

