//
//  TransactionHistoryFeature.swift
//  TransactionHistoryFeature
//
//  Created by Andy ⠀ on 06/12/23.
//

import UIKit
import RouterServiceInterface
import WalletServices
import NavigationRoute

public struct TransactionHistoryFeature: Feature {
    @Dependency var routerService: RouterServiceProtocol
    @Dependency var wallet: WalletServiceInterface
    
    public init() {}
    
    public func build(fromRoute route: Route?) -> UIViewController {
        return TransactionHistoryFeatureRouter.createModule(wallet: wallet)
    }
}

public class TransactionHistoryRouteHandler: RouteHandler {
    public var routes: [Route.Type] {
        return [TransactionHistoryRoute.self]
    }

    public func destination(
        forRoute route: Route,
        fromViewController viewController: UIViewController
    ) -> Feature.Type {
        guard route is TransactionHistoryRoute else {
            preconditionFailure("unexpected route")
        }
        return TransactionHistoryFeature.self
    }

    public init() {}
}
