//
//  AppDelegate.swift
//  Auth-App
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
        let queryParam = url.queryParameters ?? [:]
        let host = url.host ?? "Unknown"
        if host == AppConstants.chatAppScheme, queryParam["action"] == "auth" {
            authAction()
        }
            
        return true
    }
    
    func authAction() {
        let otherAlert = UIAlertController(title: "Authentication", message: "Are you authenticate your app now?", preferredStyle: .alert)
        let printSomething = UIAlertAction(title: "Verify", style: .default) { _ in
            let urlString = AppConstants.chatAppScheme + "://" + AppConstants.authAppScheme + "?action=allow"
            if let authUrlScheme = URL(string: urlString) {
                UIApplication.shared.open(authUrlScheme)
            }
        }
        // relate actions to controllers
        otherAlert.addAction(printSomething)
        window?.rootViewController?.present(otherAlert, animated: true)
    }
}

