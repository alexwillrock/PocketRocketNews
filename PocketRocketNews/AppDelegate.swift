//
//  AppDelegate.swift
//  PocketRocketNews
//
//  Created by Алексей on 16.03.17.
//  Copyright © 2017 Алексей. All rights reserved.
//

import UIKit
import MagicalRecord

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        MagicalRecord.cleanUp()
        MagicalRecord.setupCoreDataStack(withAutoMigratingSqliteStoreNamed: "PocketRocketNews")
        
        
        return true
    }

}

