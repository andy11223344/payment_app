//
//  PaymentFeature.swift
//  PaymentFeature
//
//  Created by Andy ⠀ on 07/12/23.
//

import UIKit
import RouterServiceInterface
import WalletServices
import NavigationRoute

public struct PaymentFeature: Feature {
    @Dependency var routerService: RouterServiceProtocol
    @Dependency var wallet: WalletServiceInterface
    
    public init() {}
    
    public func build(fromRoute route: Route?) -> UIViewController {
        guard let paymentRoute = route as? PaymentRoute else { return UIViewController() }
        
        return PaymentRouter.createModule(
            data: paymentRoute.data,
            wallet: wallet
        )
    }
}

public class PaymentRouteHandler: RouteHandler {
    public var routes: [Route.Type] {
        return [PaymentRoute.self]
    }
    
    public func destination(
        forRoute route: Route,
        fromViewController viewController: UIViewController
    ) -> Feature.Type {
        guard route is PaymentRoute else {
            preconditionFailure("unexpected route")
        }
        return PaymentFeature.self
    }
    
    public init() {}
}
