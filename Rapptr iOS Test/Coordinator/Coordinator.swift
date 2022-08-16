//
//  Coordinator.swift
//  Rapptr iOS Test
//
//  Created by Ryan Ofori on 8/15/22.
//

import UIKit
protocol Coordinator: AnyObject {
    
    var childCoordinators: [Coordinator] { get set }
    
    var navigationController: UINavigationController { get set }
    
    func start()
}
