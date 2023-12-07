//
//  UserDefaultWrapper.swift
//  Common
//
//  Created by Andy ⠀ on 05/12/23.
//

import Foundation

@propertyWrapper
    public struct UserDefault<T: Codable> {
        public let key: String
        public let defaultValue: T

        public init(_ key: String, defaultValue: T) {
            self.key = key
            self.defaultValue = defaultValue
        }

        public var wrappedValue: T {
            get {

                if let data = UserDefaults.standard.object(forKey: key) as? Data,
                    let user = try? JSONDecoder().decode(T.self, from: data) {
                    return user

                }

                return  defaultValue
            }
            set {
                if let encoded = try? JSONEncoder().encode(newValue) {
                    UserDefaults.standard.set(encoded, forKey: key)
                }
            }
        }
    }
