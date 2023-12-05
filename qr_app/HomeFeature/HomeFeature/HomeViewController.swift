//
//  HomeViewController.swift
//  HomeFeature
//
//  Created by Andy ⠀ on 05/12/23.
//  
//

import UIKit

public class HomeViewController: UIViewController {
    
    var presenter: HomePresentation?
    
    public init() {
        super.init(nibName: nil, bundle: Bundle(for: HomeViewController.self))
    }

    required init?(coder: NSCoder) { fatalError() }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension HomeViewController: HomeView{
    
}
