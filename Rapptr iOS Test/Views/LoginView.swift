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
    
    lazy var emailField: UITextField = {
        let emailField = commonTextField(placeHolder: "Email")
        return emailField
    }()
    
    lazy var passwordField: UITextField = {
        let passwordField = commonTextField(placeHolder: "Password")
        passwordField.isSecureTextEntry = true
        return passwordField
    }()
    
    var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = Style.Colors.ButtonTextColor
        button.backgroundColor = Style.Colors.buttonBackground //UIColor(hex: "#0E5C89")
        button.setTitle("LOGIN", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = Style.Fonts.buttonText //.systemFont(ofSize: 16, weight: .semibold)
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
        [backgroundImage, emailField, passwordField, loginButton].forEach { addSubview($0) }
        
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
    
    func commonTextField(placeHolder: String) -> UITextField {
        let commonField = UITextField()
        commonField.layer.cornerRadius = 5
        commonField.backgroundColor = Style.Colors.LoginBackground
        commonField.attributedPlaceholder = NSAttributedString(
            string: placeHolder,
            attributes: [NSAttributedString.Key.foregroundColor : Style.Colors.LoginPlaceholderColor])
        commonField.textColor = Style.Colors.LoginFilledColor //UIColor(hex: "#1B1E1F")
        commonField.font = commonField.font?.withSize(16)
        commonField.translatesAutoresizingMaskIntoConstraints = false
        commonField.layer.cornerRadius = 8
        commonField.leftViewMode = .always
        commonField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 24, height: commonField.frame.height))
        return commonField
    }
    
}
