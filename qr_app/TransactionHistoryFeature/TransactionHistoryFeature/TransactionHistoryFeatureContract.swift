//
//  TransactionHistoryFeatureContract.swift
//  TransactionHistoryFeature
//
//  Created by Andy ⠀ on 06/12/23.
//  
//

import UIKit
import RouterServiceInterface

// MARK: - ViewController
protocol TransactionHistoryFeatureView: AnyObject {
    var presenter: TransactionHistoryFeaturePresentation { get set }
    func historyDidClear()
}

// MARK: - Presenter
protocol TransactionHistoryFeaturePresentation: AnyObject {
    
    var view: TransactionHistoryFeatureView? { get set }
    var interactor: TransactionHistoryFeatureUseCase? { get set }
    var router: TransactionHistoryFeatureWireframe? { get set }
    
    var transcationHistoryCount: Int { get }
    
    func date(_ index: Int) -> String
    func merchant(_ index: Int) -> String
    func amount(_ index: Int) -> String
    
    func clearHistory()
}


// MARK: - Interactor
protocol TransactionHistoryFeatureUseCase: AnyObject {
    var presenter: TransactionHistoryFeatureInteractorOutput? { get set }
}


// MARK: - Interactor Output
protocol TransactionHistoryFeatureInteractorOutput: AnyObject {
    
}

// MARK: - Router
protocol TransactionHistoryFeatureWireframe: AnyObject {
    var view: UIViewController? { get set }
}
