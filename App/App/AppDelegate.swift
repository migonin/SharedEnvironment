//
//  AppDelegate.swift
//  App
//
//  Created by m.igonin on 25.02.2020.
//  Copyright © 2020 m.igonin. All rights reserved.
//

import UIKit
import Core

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if let viewController = window?.rootViewController as? ViewController {
            let launchArguments = ProcessInfo.processInfo.arguments
            let launchEnvironment = ProcessInfo.processInfo.environment
            let detector: EnvironmentModeDetecting = EnvironmentModeDetector()
            let storage: IStorage = UserDefaults(suiteName: "group.test")!
            
            let mode = detector.getEnvironmentMode(launchArguments: launchArguments,
                                                   storage: storage,
                                                   environment: launchEnvironment)
            
            let environment = Environment(mode: mode)
            
            viewController.environment = environment
        }
        
        return true
    }

}

