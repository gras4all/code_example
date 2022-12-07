//
//  AppDelegate.swift
//  iStore
//
//  Created by Andrey Grunenkov on 06.12.2022.
//  Copyright © 2022 Andrey Grunenkov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: DevicesCollectionViewController())
        window?.makeKeyAndVisible()
        
        return true
    }


}

