//
//  HomeCollectionViewCell.swift
//  HomeFeature
//
//  Created by Andy ⠀ on 06/12/23.
//

import UIKit
import Common

class HomeCollectionViewCell: UICollectionViewCell, NibReusable {
    
    private struct UX {
        static let cornerRadius = CGFloat(8)
    }

    @IBOutlet weak var mainContainer: UIView!
    @IBOutlet weak var menuImageView: UIImageView!
    
    @IBOutlet weak var menuTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        mainContainer.layer.cornerRadius = UX.cornerRadius
    }

}
