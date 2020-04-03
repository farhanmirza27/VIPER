//
//  AppDelegate.swift
//  VIPER
//
//  Created by Farhan Mirza on 02/04/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        // create post module
        window?.rootViewController = UINavigationController(rootViewController:  PostsRouter.createModule())
        return true
    }

}

