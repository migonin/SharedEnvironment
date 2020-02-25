//
//  EnvironmentVariable.swift
//  Core
//
//  Created by m.igonin on 21.02.2020.
//  Copyright © 2020 m.igonin. All rights reserved.
//

import Foundation

public enum EnvironmentVariable: String {
    
    case xAPIEndpoint
    case xSomeFeature
    case xSomeValue
}

public extension EnvironmentVariable {
    
    var defaultValue: String {
        switch self {
        case .xAPIEndpoint:
            return "https://prod.api.com"
        case .xSomeFeature:
            return "false"
        case .xSomeValue:
            return "0"
        }
    }
    
    func valueFromEnvironmentOrDefault(_ environment: [String: String]) -> String {
        return environment[rawValue] ?? defaultValue
    }
}
