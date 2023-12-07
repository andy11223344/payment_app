//
//  Auth.swift
//  AuthService
//
//  Created by Andy ⠀ on 05/12/23.
//

import Foundation
import Models
import Common
import Shared

public class Auth {
    
    public static let current: Auth = Auth()
    
    private init() {}
    
    public var user: User? {
        return UserPersistents.user
    }
    
    public func loggedIn(user: User) {
        UserPersistents.user = user
    }
    
    public func logout() {
        UserPersistents.user = nil
        UserPersistents.wallet = nil
    }
}

public extension Auth {
    func updateUsername(_ username: String) {
        guard let user = user else { return }
        
        let updatedUser = User(id: user.id, username: username)
        UserPersistents.user = updatedUser
    }
}
