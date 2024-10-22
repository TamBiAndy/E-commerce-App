//
//  AppDelegate.swift
//  E-commerce-App
//
//  Created by Andy on 12/10/2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        if SessionManager.shared.isUserLogged {
            window?.rootViewController = TabBarController()
        } else {
            let viewModel = SignInViewModel()
            window?.rootViewController = SignInViewController(viewModel: viewModel)
        }
        window?.makeKeyAndVisible()
        
        return true
    }

}

