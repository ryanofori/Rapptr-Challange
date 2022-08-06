//
//  MenuViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class MenuViewController: UIViewController {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     *
     * 1) UI must work on iOS phones of multiple sizes. Do not worry about iPads.
     *
     * 2) Use Autolayout to make sure all UI works for each resolution
     *
     * 3) Use this starter project as a base and build upon it. It is ok to remove some of the
     *    provided code if necessary. It is ok to add any classes. This is your project now!
     *
     * 4) Read the additional instructions comments throughout the codebase, they will guide you.
     *
     * 5) Please take care of the bug(s) we left for you in the project as well. Happy hunting!
     *
     * Thank you and Good luck. - Rapptr Labs
     * =========================================================================================
     */
    
    // MARK: - Outlets
    
    var stackView = UIStackView()
    
    var backgroundImage: UIImageView = {
        let backgroundImage = UIImageView(frame: .zero)
        backgroundImage.image = UIImage(named: "bg_home_menu.png")
        backgroundImage.contentMode = .scaleToFill
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        return backgroundImage
    }()
    
    var chatButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white.withAlphaComponent(0.8)
        button.tintColor = .black
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("CHAT", for: .normal)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        button.contentHorizontalAlignment = .left
        button.addTarget(self, action: #selector(didPressChatButton), for: .touchUpInside)
        return button
    }()
    
    var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white.withAlphaComponent(0.8)
        button.tintColor = .black
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        button.contentHorizontalAlignment = .left
        button.addTarget(self, action: #selector(didPressLoginButton), for: .touchUpInside)
        button.setTitle("LOGIN", for: .normal)
        return button
    }()
    var animationButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white.withAlphaComponent(0.8)
        button.tintColor = .black
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        button.contentHorizontalAlignment = .left
        button.addTarget(self, action: #selector(didPressAnimationButton), for: .touchUpInside)
        button.setTitle("ANIMATION", for: .normal)
        return button
    }()
    
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        showTitle(true)
//        view.insertSubview(backgroundImage, at: 0)
        [backgroundImage, stackView].forEach { view.addSubview($0) }
        
        //background
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        //stackview
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 24
        [chatButton, loginButton, animationButton].forEach { stackView.addArrangedSubview($0) }
        
        chatButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        animationButton.heightAnchor.constraint(equalToConstant: 55).isActive = true

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        showTitle(false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        showTitle(true)
    }
    
    func showTitle(_ yes: Bool){
        if yes {
            title = "Coding Tasks"
        } else {
            title = ""
        }
    }
    
    
    // MARK: - Actions
    @objc private func didPressChatButton() {
        let loginViewController = ChatViewController()
        navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    @objc private func didPressLoginButton() {
        let loginViewController = LoginViewController()
        navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    @objc private func didPressAnimationButton() {
        let animationViewController = AnimationViewController()
        navigationController?.pushViewController(animationViewController, animated: true)
    }
}
