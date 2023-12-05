//
//  HomeFeature.swift
//  HomeFeature
//
//  Created by Andy ⠀ on 05/12/23.
//

import UIKit
import RouterServiceInterface

public struct HomeFeature: Feature {
    @Dependency var routerService: RouterServiceProtocol
    
    public init() {}
    
    public func build(fromRoute route: Route?) -> UIViewController {
        return HomeRouter.createModule(routerService: routerService)
    }
}
