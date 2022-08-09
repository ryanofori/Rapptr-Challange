//
//  AnimationViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class AnimationViewController: UIViewController {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Make the UI look like it does in the mock-up.
     *
     * 2) Logo should fade out or fade in when the user hits the Fade In or Fade Out button
     *
     * 3) User should be able to drag the logo around the screen with his/her fingers
     *
     * 4) Add a bonus to make yourself stick out. Music, color, fireworks, explosions!!! Have Swift experience? Why not write the Animation 
     *    section in Swfit to show off your skills. Anything your heart desires!
     *
     */
    
    var animationView = AnimationView()
    
    var logoVisable = true
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view = animationView
        title = "Animation"
        changeStatusColor()
        animationView.fadeButton.addTarget(self, action: #selector(animatedLogo), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @IBAction func backAction(_ sender: Any) {
        let mainMenuViewController = MenuViewController()
        self.navigationController?.pushViewController(mainMenuViewController, animated: true)
    }
    
    @IBAction func didPressFade(_ sender: Any) {
        animatedLogo()
    }
    
    @objc func animatedLogo() {
        if logoVisable {
            UIView.animate(withDuration: 1.5) {
                self.animationView.logoImage.alpha = 0
            }
            animationView.fadeButton.setTitle("Fade Out", for: .normal)
            logoVisable = false
        } else {
            UIView.animate(withDuration: 1.5) {
                self.animationView.logoImage.alpha = 1
            }
            animationView.fadeButton.setTitle("Fade In", for: .normal)
            logoVisable = true
        }
        
    }
    
}
