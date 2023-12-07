//
//  HomeFeature.swift
//  HomeFeature
//
//  Created by Andy ⠀ on 05/12/23.
//

import UIKit
import RouterServiceInterface
import AuthService
import WalletServices
import Shared

public struct HomeFeature: Feature {
    @Dependency var routerService: RouterServiceProtocol
    @Dependency var wallet: WalletServiceInterface
    
    public init() {}
    
    public func build(fromRoute route: Route?) -> UIViewController {
        return HomeRouter.createModule(
            routerService: routerService,
            wallet: wallet
        )
    }
}
