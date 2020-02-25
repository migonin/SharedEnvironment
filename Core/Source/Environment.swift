//
//  Environment.swift
//  Core
//
//  Created by m.igonin on 25.02.2020.
//  Copyright © 2020 m.igonin. All rights reserved.
//

import Foundation

public struct Environment {
    public enum InitMode: CustomStringConvertible {
        case prod
        case xCode(environment: [String: String])
        case shared(environment: [String: String])
        
        public var description: String {
            switch self {
            case .prod:
                return "prod"
            case .shared:
                return "shared"
            case .xCode:
                return "xCode"
            }
        }
    }
    
    public let apiEndpoint: String
    public let someFeature: Bool
    public let someValue: Int
    public let mode: InitMode
    
    public init(mode: InitMode) {
        self.mode = mode
        
        switch mode {
        case .prod:
            self.apiEndpoint = EnvironmentVariable.xAPIEndpoint.defaultValue
            self.someFeature = Bool(EnvironmentVariable.xSomeFeature.defaultValue)!
            self.someValue = Int(EnvironmentVariable.xSomeValue.defaultValue)!
            
        case .shared(let environment), .xCode(let environment):
            self.apiEndpoint = EnvironmentVariable.xAPIEndpoint.valueFromEnvironmentOrDefault(environment)
            self.someFeature = Bool(EnvironmentVariable.xSomeFeature.valueFromEnvironmentOrDefault(environment))!
            self.someValue = Int(EnvironmentVariable.xSomeValue.valueFromEnvironmentOrDefault(environment))!
        }
    }
}
