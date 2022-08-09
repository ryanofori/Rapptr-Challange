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
    var animationViewModel = AnimationViewModel()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view = animationView
        showTitle("Animation")
        changeStatusColor()
        animationView.fadeButton.addTarget(self, action: #selector(animatedLogo), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc func animatedLogo() {
        if animationViewModel.logoVisable {
            UIView.animate(withDuration: 1.5) {
                self.animationView.logoImage.alpha = 0
            }
            animationView.fadeButton.setTitle("Fade Out", for: .normal)
            animationViewModel.logoVisable = false
        } else {
            UIView.animate(withDuration: 1.5) {
                self.animationView.logoImage.alpha = 1
            }
            animationView.fadeButton.setTitle("Fade In", for: .normal)
            animationViewModel.logoVisable = true
        }
        
    }
    
}
