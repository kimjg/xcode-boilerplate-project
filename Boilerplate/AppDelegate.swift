//
//  AppDelegate.swift
//  Boilerplate
//
//  Created by Jerry Kim on 2020/02/16.
//  Copyright © 2020 Jerry Kim. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let mainScreenBounds = UIScreen.main.bounds
        let window = UIWindow(frame: mainScreenBounds)
        let mainViewController = MainViewController()
        mainViewController.viewModel = MainViewModel()
        window.rootViewController = mainViewController
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }

}

