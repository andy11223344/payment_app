//
//  TransactionHistoryTableCell.swift
//  TransactionHistoryFeature
//
//  Created by Andy ⠀ on 06/12/23.
//

import UIKit
import Common

class TransactionHistoryTableCell: UITableViewCell, NibReusable {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var merchantLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
