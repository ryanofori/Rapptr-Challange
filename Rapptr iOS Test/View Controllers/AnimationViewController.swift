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
        setUpLogo()
        
        animationView.fadeButton.addTarget(self, action: #selector(animatedLogo), for: .touchUpInside)
        
    }
    
    func setUpLogo() {
        if animationViewModel.islogoVisable {
            animationView.logoImage.alpha = 1
        } else {
            animationView.logoImage.alpha = 0
        }
    }
    
    // MARK: - Actions
    @objc func animatedLogo() {
        
        if animationViewModel.islogoVisable {
            UIView.animate(withDuration: 1.5) {
                self.animationView.logoImage.alpha = 0
            }
            animationView.fadeButton.setTitle("Fade In", for: .normal)
            animationViewModel.islogoVisable = false
            confetiiLayer()
            
        } else {
            UIView.animate(withDuration: 1.5) {
                self.animationView.logoImage.alpha = 1
            }
            animationView.fadeButton.setTitle("Fade Out", for: .normal)
            animationViewModel.islogoVisable = true
            confetiiLayer()
        }
    }
    
    private func confetiiLayer() {
        
        let layer = CAEmitterLayer()
        layer.emitterPosition = CGPoint(x: view.center.x, y: -100)
        layer.name = "confetii"
        
        let colors: [UIColor] = [
            .systemRed, .systemBlue, .systemYellow, .systemGreen
        ]
        let cells: [CAEmitterCell] = colors.compactMap{
            let cell = CAEmitterCell()
            cell.scale = 0.02
            cell.birthRate = 40
            cell.lifetime = 10
            cell.emissionRange = .pi * 2
            cell.velocity = 150
            cell.color = $0.cgColor
            cell.contents = UIImage(named: "WhiteSquare")?.cgImage
            return cell
        }
        
        layer.emitterCells = cells
        if animationViewModel.islogoVisable {
            view.layer.addSublayer(layer)
        } else {
            view.layer.sublayers?.forEach { layer in
                if layer.name == "confetii" {
                    layer.removeFromSuperlayer()
                }
            }
        }
    }
    
}
