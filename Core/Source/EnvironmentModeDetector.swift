//
//  EnvironmentModeDetector.swift
//  Core
//
//  Created by m.igonin on 25.02.2020.
//  Copyright © 2020 m.igonin. All rights reserved.
//

import Foundation

public protocol EnvironmentModeDetecting {
    
    func getEnvironmentMode(launchArguments: [String],
                            storage: IStorage,
                            environment: [String: String]) -> Environment.InitMode
}

public struct EnvironmentModeDetector: EnvironmentModeDetecting {
    
    public init() { }
    
    public func getEnvironmentMode(launchArguments: [String],
                                   storage: IStorage,
                                   environment: [String: String]) -> Environment.InitMode {
        let useEnvironmentVariablesArg = LaunchArgument.xUseEnvironmentVariables.rawValue
        let isUseEnvironmentVariables = launchArguments.contains(useEnvironmentVariablesArg)

        if isUseEnvironmentVariables {
            return .xCode(environment: environment)
        } else if let sharedEnvironment = storage.sharedEnvironment, storage.useSharedEnvironment {
            return .shared(environment: sharedEnvironment)
        } else {
            return .prod
        }
    }
}
