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
    
    var menuView = MenuView()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view = menuView

        menuView.chatButton.addTarget(self, action: #selector(didPressChatButton), for: .touchUpInside)
        menuView.loginButton.addTarget(self, action: #selector(didPressLoginButton), for: .touchUpInside)
        menuView.animationButton.addTarget(self, action: #selector(didPressAnimationButton), for: .touchUpInside)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        showTitle("")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        showTitle("Coding Task")
        changeStatusColor()
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
