//
//  SharedStorage.swift
//  Core
//
//  Created by m.igonin on 25.02.2020.
//  Copyright © 2020 m.igonin. All rights reserved.
//

import Foundation

public protocol IStorage {
    func set(_ value: Any?, forKey key: String)
    func object(forKey key: String) -> Any?
}

private extension String {
    static let useSharedEnvironmentKey = "useSharedEnvironmentKey"
    static let sharedEnvironmentKey = "sharedEnvironmentKey"
}

public extension IStorage {
    func setUseSharedEnvironment(_ value: Bool) {
        set(value, forKey: .useSharedEnvironmentKey)
    }
    
    var useSharedEnvironment: Bool {
        return (object(forKey: .useSharedEnvironmentKey) as? Bool) ?? false
    }

    func setSharedEnvironment(_ value: [String: String]) {
        set(value, forKey: .sharedEnvironmentKey)
    }
    
    var sharedEnvironment: [String: String]? {
        return object(forKey: .sharedEnvironmentKey) as? [String: String]
    }
}

extension UserDefaults: IStorage { }
