//
//  Alert.swift
//  Rapptr iOS Test
//
//  Created by Ryan Ofori on 8/11/22.
//

import Foundation
import UIKit
class Alert {
    func showAlert(mesageTitle: String, messageDesc: String, viewController: UIViewController, completion: @escaping (UIAlertAction) -> Void ) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: mesageTitle, message: messageDesc, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default,handler: completion))
            viewController.present(alertController, animated: true, completion: nil)
        }
    }
}
