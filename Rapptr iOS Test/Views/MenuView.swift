//
//  MenuView.swift
//  Rapptr iOS Test
//
//  Created by Ryan Ofori on 8/9/22.
//

import Foundation
import UIKit
class MenuView: UIView {
    var stackView = UIStackView()
    
    let imageSize = CGSize(width: 24, height: 24)
    
    var backgroundImage: UIImageView = {
        let backgroundImage = UIImageView(frame: .zero)
        backgroundImage.image = UIImage(named: "bg_home_menu.png")
        backgroundImage.contentMode = .scaleToFill
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        return backgroundImage
    }()
    
    lazy var chatButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "ic_chat.png"), for: .normal)
        button.backgroundColor = .white.withAlphaComponent(0.8)
        button.tintColor = .black
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("CHAT", for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 22, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 46, bottom: 0, right: 0)
        button.contentHorizontalAlignment = .left
//        button.addTarget(self, action: #selector(didPressChatButton), for: .touchUpInside)
        return button
    }()
    
    var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "ic_login.png"), for: .normal)
        button.backgroundColor = .white.withAlphaComponent(0.8)
        button.tintColor = .black
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 22, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 46, bottom: 0, right: 0)
        button.contentHorizontalAlignment = .left
//        button.addTarget(self, action: #selector(didPressLoginButton), for: .touchUpInside)
        button.setTitle("LOGIN", for: .normal)
        return button
    }()
    var animationButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "ic_animation.png"), for: .normal)
        button.backgroundColor = .white.withAlphaComponent(0.8)
        button.tintColor = .black
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 22, bottom: 0, right: 0)
        
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 46, bottom: 0, right: 0)
        button.contentHorizontalAlignment = .left
//        button.addTarget(self, action: #selector(didPressAnimationButton), for: .touchUpInside)
        button.setTitle("ANIMATION", for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = Style.Colors.viewBackground
        
        [backgroundImage, stackView].forEach { addSubview($0) }
        
        //background
        backgroundImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        
        //stackview
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 30).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 24
        [chatButton, loginButton, animationButton].forEach { stackView.addArrangedSubview($0) }
        
        chatButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        animationButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
    }
    
}
