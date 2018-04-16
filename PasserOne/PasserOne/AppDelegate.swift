//
//  AppDelegate.swift
//  PasserOne
//
//  Created by Ariel Elkin on 16/04/2018.
//  Copyright © 2018 ariel. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let vc = ViewController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {

        guard url.scheme == "com.ariel.passerone" else {
            return false
        }

        if let message = url.host {
            vc.string = message
            return true
        }

        return false
    }
}

