//
//  SceneDelegate.swift
//  RedditFeed
//
//  Created by Roel Castano on 1/27/23.
//

import Foundation
import UIKit

class SceneDelegate: NSObject, UISceneDelegate {

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // A new scene was added to the app.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIViewController()
            window.makeKeyAndVisible()
        }
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // A scene did enter the background.
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // A scene is about to enter the foreground.
    }
}
