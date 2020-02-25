//
//  AppDelegate.swift
//  Settings
//
//  Created by m.igonin on 25.02.2020.
//  Copyright © 2020 m.igonin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if let viewController = window?.rootViewController as? SettingsViewController {
            viewController.storage = UserDefaults(suiteName: "group.test")!
        }
        
        return true
    }
}

