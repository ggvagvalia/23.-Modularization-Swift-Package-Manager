//
//  SceneDelegate.swift
//  23. Modularization-Swift Package Manager
//
//  Created by gvantsa gvagvalia on 5/2/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UINavigationController(rootViewController: MainPage())
        self.window = window
        window.backgroundColor = .tertiarySystemBackground
        window.makeKeyAndVisible()
    }

}

