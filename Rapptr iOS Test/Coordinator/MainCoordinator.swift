//
//  FirstCoordinator.swift
//  Rapptr iOS Test
//
//  Created by Ryan Ofori on 8/15/22.
//

import Foundation
import UIKit
class MainCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let firstViewController = MenuViewController()
        firstViewController.delegate = self
        self.navigationController.viewControllers = [firstViewController]
    }
    
}
extension MainCoordinator: MenuViewControllerDelegate {
    
    func navigateToChatPage() {
        let secondCoordinator = SecondCoordinator(navigationController: navigationController)
        childCoordinators.append(secondCoordinator)
        secondCoordinator.start()
    }
    
    func navigateToLoginPage() {
        let secondCoordinator = SecondCoordinator(navigationController: navigationController)
        childCoordinators.append(secondCoordinator)
        secondCoordinator.login()
    }
    
    func navigateToAnimationPage() {
        let secondCoordinator = SecondCoordinator(navigationController: navigationController)
        childCoordinators.append(secondCoordinator)
        secondCoordinator.animation()
    }
}
extension MainCoordinator: BackToFirstViewControllerDelegate {
    func navigateBackToFirstPage(newOrderCoordinator: SecondCoordinator) {
        navigationController.popViewController(animated: true)
        childCoordinators.removeLast()
    }
    
    
}
