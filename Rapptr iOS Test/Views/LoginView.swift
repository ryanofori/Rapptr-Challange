//
//  LoginView.swift
//  Rapptr iOS Test
//
//  Created by Ryan Ofori on 8/9/22.
//

import Foundation
import UIKit
class LoginView: UIView {
    var backgroundImage: UIImageView = {
        let backgroundImage = UIImageView(frame: .zero)
        backgroundImage.image = UIImage(named: "img_login.png")
        backgroundImage.contentMode = .scaleToFill
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        return backgroundImage
    }()
    
    var emailField: UITextField = {
        let emailField = UITextField()
        emailField.layer.cornerRadius = 5
        emailField.backgroundColor = .white.withAlphaComponent(0.5) //?
        //        emailField.placeholder = "Email"
        emailField.attributedPlaceholder = NSAttributedString(
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor : Style.Colors.LoginPlaceholderColor  /*UIColor(hex: "#5F6063")*/])
        emailField.textColor = Style.Colors.LoginFilledColor //UIColor(hex: "#1B1E1F")
        emailField.font = emailField.font?.withSize(16)
        emailField.translatesAutoresizingMaskIntoConstraints = false
        emailField.layer.cornerRadius = 8
        emailField.leftViewMode = .always
        emailField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 24, height: emailField.frame.height))
        return emailField
    }()
    
    var passwordField: UITextField = {
        let passwordField = UITextField()
        passwordField.layer.cornerRadius = 5
        passwordField.backgroundColor = .white.withAlphaComponent(0.5)
        //        passwordField.placeholder = "Password"
        passwordField.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor : Style.Colors.LoginPlaceholderColor /*UIColor(hex: "#5F6063")*/])
        passwordField.textColor = Style.Colors.LoginFilledColor //UIColor(hex: "#1B1E1F")
        passwordField.font = passwordField.font?.withSize(16)
        passwordField.layer.cornerRadius = 8
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.leftViewMode = .always
        passwordField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 24, height: passwordField.frame.height))
        return passwordField
    }()
    
    var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = Style.Colors.ButtonTextColor
        button.backgroundColor = Style.Colors.buttonBackground //UIColor(hex: "#0E5C89")
        button.setTitle("LOGIN", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
//        button.addTarget(self, action: #selector(didPressLoginButton), for: .touchUpInside)
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
        insertSubview(backgroundImage, at: 0)
        [/*backgroundImage, */emailField, passwordField, loginButton].forEach { addSubview($0) }
        
        backgroundImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        emailField.heightAnchor.constraint(equalToConstant: 55).isActive = true
        emailField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant:  64).isActive = true
        emailField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        emailField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
        
        
        passwordField.heightAnchor.constraint(equalToConstant: 55).isActive = true
        passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor,constant: 24).isActive = true
        passwordField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        passwordField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
        
        
        loginButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 24).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
    }
    
}
