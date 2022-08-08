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
    
//    @IBOutlet weak var logoImage: UIImageView!
//    @IBOutlet weak var FadeButton: UIButton!
    
    var fadeButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = Style.Colors.ButtonTextColor //UIColor(hex: "#FFFFFF")
        button.backgroundColor = Style.Colors.buttonBackground //UIColor(hex: "#0E5C89")
        button.setTitle("FADE IN", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.frame =  CGRect(x: 100, y: 100, width: 200, height: 50)
        button.addTarget(self, action: #selector(animatedLogo), for: .touchUpInside)
        return button
    }()
    
    var logoImage: UIImageView = {
        let logoImage = UIImageView(frame: .zero)
        logoImage.image = UIImage(named: "ic_logo.png")
        logoImage.contentMode = .scaleAspectFill
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        return logoImage
    }()
    
    var logoVisable = true
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Style.Colors.viewBackground //UIColor(hex: "#F9F9F9")
        title = "Animation"
        [fadeButton, logoImage].forEach { view.addSubview($0) }
        logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 100).isActive = true
        logoImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        logoImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        logoImage.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        fadeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24).isActive = true
        fadeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        fadeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        fadeButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
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
                self.logoImage.alpha = 0
            }
            fadeButton.setTitle("Fade Out", for: .normal)
            logoVisable = false
        } else {
            UIView.animate(withDuration: 1.5) {
                self.logoImage.alpha = 1
            }
            fadeButton.setTitle("Fade In", for: .normal)
            logoVisable = true
        }
        
    }
    
    
}
