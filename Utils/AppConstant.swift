//
//  AppConstant.swift
//  Chat-App
//
//  Created by Sparkout on 05/01/23.
//

import Foundation

extension Notification {
    static let loggedIn: Notification.Name = .init(rawValue: "USER_LOGGEDIN")
}

struct AppConstants {
    static var loggedIn: Bool = false
    static var username: String?
    
    static let authAppScheme: String = "authappdeeplink"
    static let chatAppScheme: String = "chatappdeeplink"
}


extension URL {
    public var queryParameters: [String: String]? {
        guard
            let components = URLComponents(url: self, resolvingAgainstBaseURL: true),
            let queryItems = components.queryItems else { return nil }
        return queryItems.reduce(into: [String: String]()) { (result, item) in
            result[item.name] = item.value
        }
    }
}
