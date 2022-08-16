//
//  SecondCoordinator.swift
//  Rapptr iOS Test
//
//  Created by Ryan Ofori on 8/15/22.
//
import Foundation
import UIKit

protocol BackToFirstViewControllerDelegate: AnyObject {
    
    func navigateBackToFirstPage(newOrderCoordinator: SecondCoordinator)
    
}

class SecondCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    weak var delegate: BackToFirstViewControllerDelegate?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let secondViewController: ChatViewController = ChatViewController()
        secondViewController.delegate = self
        navigationController.pushViewController(secondViewController, animated: true)
    }
    
    func login(){
        let secondViewController: LoginViewController = LoginViewController()
        secondViewController.delegate = self
        navigationController.pushViewController(secondViewController, animated: true)
    }
    
    func animation() {
        let secondViewController: AnimationViewController = AnimationViewController()
        secondViewController.delegate = self
        navigationController.pushViewController(secondViewController, animated: true)
    }
    
}

extension SecondCoordinator: SecondViewControllerDelegate {
    func navigateToFirstPage() {
        delegate?.navigateBackToFirstPage(newOrderCoordinator: self)
    }
    
}
