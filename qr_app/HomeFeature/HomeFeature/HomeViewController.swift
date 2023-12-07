//
//  HomeViewController.swift
//  HomeFeature
//
//  Created by Andy ⠀ on 05/12/23.
//  
//

import UIKit
import AuthService
import Common

class HomeViewController: BaseViewController {
    
    private struct UX {
        static let headerCornerRadius: CGFloat = 20.0
        
        static let flowLayout: UICollectionViewFlowLayout = {
            let layout = UICollectionViewFlowLayout()
            let spacing: CGFloat = 14
            layout.minimumInteritemSpacing = spacing
            layout.minimumLineSpacing = spacing
            layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
            return layout
        }()
    }
    
    @IBOutlet weak var headerContainer: UIView!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var balanceLabel: UILabel!
    
    @IBOutlet weak var menuCollectionView: UICollectionView!
    
    var presenter: HomePresentation
    
    init(presenter: HomePresentation) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: Bundle(for: HomeViewController.self))
    }

    required init?(coder: NSCoder) { fatalError() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func setup() {
        menuCollectionView.register(cellType: HomeCollectionViewCell.self)
        menuCollectionView.dataSource = self
        menuCollectionView.delegate = self
        menuCollectionView.collectionViewLayout = UX.flowLayout
        
        usernameLabel.text = presenter.username
        balanceLabel.text = presenter.balance
    }
    
    func setupView() {
        headerContainer.layer.cornerRadius = UX.headerCornerRadius
    }
    
    @IBAction func updateBalanceDidTouchUpInside(_ sender: Any) {
        showInputDialog(title: "Update Balance", subtitle: "Insert Amount", actionTitle: "OK", inputPlaceholder: "Amount", inputKeyboardType: .numberPad, cancelHandler: nil) { [weak self] text in
            self?.presenter.updateBalance(text: text)
        }
    }
}

extension HomeViewController: HomeView{
    func reloadViewData() {
        balanceLabel.text = presenter.balance
    }
    
    func showAlert(message: String) {
        self.showAlert(title: "", message: message)
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.menuCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: HomeCollectionViewCell.self)
        
        let menu = presenter.mainMenu(indexPath.row)
        cell.menuImageView.image = menu.image
        cell.menuTitle.text = menu.title
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.openPage(menuIndex: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let numberOfItemsPerRow: CGFloat = 3
        let spacing: CGFloat = UX.flowLayout.minimumInteritemSpacing
        let availableWidth = width - spacing * (numberOfItemsPerRow + 1)
        let itemDimension = floor(availableWidth / numberOfItemsPerRow)
        return CGSize(width: itemDimension, height: itemDimension)
    }
}

