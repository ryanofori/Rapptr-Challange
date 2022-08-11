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
        let button = commonButton()
        button.setImage(UIImage(named: "ic_chat.png"), for: .normal)
        button.setTitle("CHAT", for: .normal)
        return button
    }()
    
    lazy var loginButton: UIButton = {
        let button = commonButton()
        button.setImage(UIImage(named: "ic_login.png"), for: .normal)
        button.setTitle("LOGIN", for: .normal)
        return button
    }()
    
    lazy var animationButton: UIButton = {
        let button = commonButton()
        button.setImage(UIImage(named: "ic_animation.png"), for: .normal)
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
        
        backgroundImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        
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
    
    func commonButton() -> UIButton {
        let button = UIButton(type: .system)
        button.backgroundColor = Style.Colors.menuButtonBackground
        button.tintColor = Style.Colors.menuButtonLabel
        button.titleLabel?.font = Style.Fonts.menuText
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 22, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 0)
        button.contentHorizontalAlignment = .left
        return button
    }
    
}
