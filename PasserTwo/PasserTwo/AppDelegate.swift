//
//  AppDelegate.swift
//  PasserTwo
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

        guard url.scheme == "com.ariel.passertwo" else {
            return false
        }

        guard let defaults = UserDefaults(suiteName: "group.com.ariel.passers"),
            let encodedMessage = defaults.value(forKey: "message") as? String
            else {
                assertionFailure()
                return false
        }

        let message = encodedMessage.fromBase64()

        vc.string = message

        return true
    }
}


// https://stackoverflow.com/a/47693776/1072846
extension String {

    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self, options: Data.Base64DecodingOptions(rawValue: 0)) else {
            return nil
        }
        return String(data: data as Data, encoding: String.Encoding.utf8)
    }

    func toBase64() -> String? {
        guard let data = self.data(using: String.Encoding.utf8) else {
            return nil
        }
        return data.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))
    }
}

