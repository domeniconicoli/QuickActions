//
//  SceneDelegate.swift
//  QuickActions
//
//  Created by Domo on 14/10/2019.
//  Copyright © 2019 Domo. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func windowScene(_ windowScene: UIWindowScene, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        
        let alert = UIAlertController(title: "Quick Actions Tutorial", message: "Quick Action Identifier: \(shortcutItem.type)", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
               
        switch shortcutItem.type {
        case "com.mediumproject.Home", "com.mediumproject.Search":
            DispatchQueue.main.async {
                self.window!.rootViewController?.present(alert, animated: true, completion: nil)
            }
            break
        case "com.mediumproject.Love":
            // Using storyboard
            let mainStoryboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
            let reqVC = mainStoryboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
            if let homeVC = self.window?.rootViewController as? UINavigationController {
                // Push the new view controller
                homeVC.pushViewController(reqVC, animated: true)
                // Call the method
                reqVC.showMessage()
            }
        case "com.mediumproject.Bookmark":
            // View controller instantiate programmatically, without storyboard
            let reqVC = SecondViewController()
            if let homeVC = self.window?.rootViewController as? UINavigationController {
            // Push the new view controller
            homeVC.pushViewController(reqVC, animated: true)
            // Call the method
            reqVC.showMessage()
        }
        default:
            break
        }
    }
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

