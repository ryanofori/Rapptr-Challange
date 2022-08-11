//
//  ViewControler+Extension.swift
//  Rapptr iOS Test
//
//  Created by Ryan Ofori on 8/7/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    func changeStatusColor() {
        
        if #available(iOS 13.0, *) {
            let app = UIApplication.shared
            let statusBarHeight: CGFloat = app.statusBarFrame.size.height
            
            let statusbarView = UIView()
            statusbarView.backgroundColor = Style.Colors.headerBackground
            view.addSubview(statusbarView)
          
            statusbarView.translatesAutoresizingMaskIntoConstraints = false
            statusbarView.heightAnchor
                .constraint(equalToConstant: statusBarHeight).isActive = true
            statusbarView.widthAnchor
                .constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
            statusbarView.topAnchor
                .constraint(equalTo: view.topAnchor).isActive = true
            statusbarView.centerXAnchor
                .constraint(equalTo: view.centerXAnchor).isActive = true
          
        } else {
            let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
            statusBar?.backgroundColor = Style.Colors.headerBackground
        }
    }
    
    func showTitle(_ name: String){
        
        if name.isEmpty {
            title = ""
        } else {
            title = name
        }
    }
}
