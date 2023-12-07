//
//  QRScanner.swift
//  QRScannerFeature
//
//  Created by Andy ⠀ on 07/12/23.
//

import UIKit
import RouterServiceInterface
import NavigationRoute
import Shared

public struct QRScannerFeature: Feature {
    @Dependency var routerService: RouterServiceProtocol
    @Dependency var qrScannerInterface: QRScannerInterface
    
    public init() {}
    
    public func build(fromRoute route: Route?) -> UIViewController {
        return QRScannerRouter.createModule(routerService: routerService, qrScannerInterface: qrScannerInterface)
    }
}

public class QRScannerRouteHandler: RouteHandler {
    public var routes: [Route.Type] {
        return [QRScannerRoute.self]
    }
    
    public func destination(
        forRoute route: Route,
        fromViewController viewController: UIViewController
    ) -> Feature.Type {
        guard route is QRScannerRoute else {
            preconditionFailure("unexpected route")
        }
        return QRScannerFeature.self
    }
    
    public init() {}
}


