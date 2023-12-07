//
//  User.swift
//  Models
//
//  Created by Andy ⠀ on 05/12/23.
//

import Foundation

public struct User: Codable {
    public let id: Int
    public let username: String
    
    public init(id: Int, username: String) {
        self.username = username
        self.id = id
    }
}

extension User: Equatable {}
