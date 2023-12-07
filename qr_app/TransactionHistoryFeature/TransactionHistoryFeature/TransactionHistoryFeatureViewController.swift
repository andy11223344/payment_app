//
//  TransactionHistoryFeatureViewController.swift
//  TransactionHistoryFeature
//
//  Created by Andy ⠀ on 06/12/23.
//  
//

import UIKit
import Common

class TransactionHistoryFeatureViewController: UIViewController {
    
    @IBOutlet weak var historyTableView: UITableView!
    
    var presenter: TransactionHistoryFeaturePresentation
    
    public init(presenter: TransactionHistoryFeaturePresentation) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: Bundle(for: TransactionHistoryFeatureViewController.self))
    }

    required init?(coder: NSCoder) { fatalError() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Transaction History"
        setup()
    }
    
    func setup() {
        historyTableView.register(cellType: TransactionHistoryTableCell.self)
        historyTableView.dataSource = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Clear", style: .plain, target: self, action: #selector(self.clearHistoryTapped))
    }
    
    @objc func clearHistoryTapped() {
        presenter.clearHistory()
    }
    
}

extension TransactionHistoryFeatureViewController: TransactionHistoryFeatureView{
    
    func historyDidClear() {
        historyTableView.reloadData()
    }
}

extension TransactionHistoryFeatureViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.transcationHistoryCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: TransactionHistoryTableCell.self)
        
        let row = indexPath.row
        cell.dateLabel.text = presenter.date(row)
        cell.merchantLabel.text = presenter.merchant(row)
        cell.amountLabel.text = presenter.amount(row)
        
        return cell
    }
    
    
}
