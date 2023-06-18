//
//  AppDelegate.swift
//  MyProject
//
//  Created by HuangSenhui on 2023/6/18.
//  Copyright © 2023 H.S.H. All rights reserved.
//

import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        registerSettingBundle()
        
        return true
    }
}

extension AppDelegate {
    func registerSettingBundle() {
        let settingsBundle = Bundle.main.path(forResource: "Settings", ofType: "bundle")
        if let path = settingsBundle,
           let settings = NSDictionary(contentsOfFile: path + "/Root.plist"),
           let preferences = settings["PreferenceSpecifiers"] as? [NSDictionary] {
            var defaultsToRegister: [String: Any] = [:]
            for prefSpecification in preferences {
                if let key = prefSpecification["Key"] as? String,
                   let defaultValue = prefSpecification["DefaultValue"] {
                    defaultsToRegister[key] = defaultValue
                }
            }
            UserDefaults.standard.register(defaults: defaultsToRegister)
        }
    }
}
