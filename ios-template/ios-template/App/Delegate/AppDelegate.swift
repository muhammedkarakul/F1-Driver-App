//
//  AppDelegate.swift
//  ios-template
//
//  Created by Muhammed Karakul on 27.07.2021.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        setupWindow()
        IQKeyboardManager.shared.enable = true

        return true
    }

    private func setupWindow() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let initialViewController = MainViewController()
        let navigationController = UINavigationController(rootViewController: initialViewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
    }
}

