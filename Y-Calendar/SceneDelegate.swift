//
//  SceneDelegate.swift
//  Y-Calendar
//
//  Created by Yussef Arsalan on 02.01.25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
                window = UIWindow(windowScene: windowScene)
                // Creates the LaunchViewController
                let launchVC = LaunchViewController()
                // Sets it as root
                window?.rootViewController = launchVC
                window?.makeKeyAndVisible()
        
    }

    // Will have to update this update later on
    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}
