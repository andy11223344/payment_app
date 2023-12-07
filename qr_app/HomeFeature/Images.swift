//
//  Images.swift
//  HomeFeature
//
//  Created by Andy ⠀ on 06/12/23.
//

import UIKit
import Common

extension UIImage: NameSpaceCompatible {}

public extension NameSpace where Base: UIImage {
    static var history: UIImage? { UIImage(res: "history") }
    static var payment: UIImage? { UIImage(res: "qr_code_scanner") }
}

extension UIImage {
    convenience init?(res: String) {
        self.init(named: res, in: BundleToken.bundle, with: nil)
    }
}

private final class BundleToken {
  static let bundle: Bundle = {
      return Bundle(for: BundleToken.self)
  }()
}
