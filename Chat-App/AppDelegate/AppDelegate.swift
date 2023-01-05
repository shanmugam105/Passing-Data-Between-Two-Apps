//
//  AppDelegate.swift
//  Chat-App
//
//  Created by Sparkout on 05/01/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController")
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        let urlScheme = url.scheme ?? "Unknown"
        let queryParam = url.queryParameters ?? [:]
        let host = url.host ?? "Unknown"
        print("Our scheme: ", urlScheme, "Host: ", host, "Param: ", queryParam)
        
        if host == AppConstants.authAppScheme, queryParam["action"] == "allow" {
            print("User successfully verified!")
            NotificationCenter.default.post(name: Notification.loggedIn, object: nil)
        }
        return true
    }
}
