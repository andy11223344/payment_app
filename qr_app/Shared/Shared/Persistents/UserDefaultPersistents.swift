//
//  UserDefaultPersistents.swift
//  Shared
//
//  Created by Andy ⠀ on 05/12/23.
//

import Foundation
import Common
import Models

public struct PersistentKeys {
    public static let user = "user_key"
    public static let wallet = "wallet_key"
}

public enum UserPersistents {
    @UserDefault(PersistentKeys.user, defaultValue: nil)
    public static var user: User?
    
    @UserDefault(PersistentKeys.wallet, defaultValue: nil)
    public static var wallet: Wallet?
}
