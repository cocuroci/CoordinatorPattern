//
//  AppDelegate.swift
//  CoordinatorPattern
//
//  Created by André Cocuroci on 05/07/2019.
//  Copyright (c) 2019 André Cocuroci. All rights reserved.
//

import UIKit
import CoordinatorPattern

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: Coordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let appCoordinator = AppCoordinator(window: window)
        
        self.appCoordinator = appCoordinator
        self.window = window
        self.window?.makeKeyAndVisible()
        self.appCoordinator?.start()
        
        return true
    }
}

