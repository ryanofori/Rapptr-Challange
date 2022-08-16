//
//  SceneDelegate.swift
//  Rapptr iOS Test
//
//  Created by Ethan Humphrey on 8/11/21.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    var mainCoordinator: MainCoordinator?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: scene.coordinateSpace.bounds)
        window?.windowScene = scene
        
        let rootController = MenuViewController()
        let navigationController = UINavigationController(rootViewController: rootController)
        navigationController.navigationBar.backgroundColor = Style.Colors.headerBackground
        navigationController.navigationBar.tintColor = Style.Colors.HeaderTextColor
        navigationController.navigationBar.barStyle = .black
        navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: Style.Fonts.headerText]
        navigationController.navigationBar.inputViewController?.changeStatusColor()
        window?.rootViewController = navigationController
        mainCoordinator = MainCoordinator(navigationController: window?.rootViewController as! UINavigationController)
        mainCoordinator?.start()
        window?.makeKeyAndVisible()
    }
}

