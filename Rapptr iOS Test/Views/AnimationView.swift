//
//  AnimationView.swift
//  Rapptr iOS Test
//
//  Created by Ryan Ofori on 8/9/22.
//

import Foundation
import UIKit
class AnimationView: UIView {
    var fadeButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = Style.Colors.ButtonTextColor //UIColor(hex: "#FFFFFF")
        button.backgroundColor = Style.Colors.buttonBackground //UIColor(hex: "#0E5C89")
        button.setTitle("FADE IN", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.frame =  CGRect(x: 100, y: 100, width: 200, height: 50)
//        button.addTarget(self, action: #selector(animatedLogo), for: .touchUpInside)
        return button
    }()
    
    var logoImage: UIImageView = {
        let logoImage = UIImageView(frame: .zero)
        logoImage.image = UIImage(named: "ic_logo.png")
        logoImage.contentMode = .scaleAspectFill
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        return logoImage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupView() {
//        changeStatusColor()
        backgroundColor = Style.Colors.viewBackground //UIColor(hex: "#F9F9F9")
        
        [fadeButton, logoImage].forEach { addSubview($0) }
        
        logoImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 100).isActive = true
        logoImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        logoImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
        logoImage.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        fadeButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -24).isActive = true
        fadeButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        fadeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
        fadeButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
    }
    
}

