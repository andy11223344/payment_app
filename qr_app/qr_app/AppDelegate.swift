//
//  AppDelegate.swift
//  qr_app
//
//  Created by Andy ⠀ on 05/12/23.
//

import UIKit
import RouterService
import HomeFeature

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let routerService = RouterService()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let nav = routerService.navigationController(
            withInitialFeature: HomeFeature.self
        )
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
        return true
    }


}

