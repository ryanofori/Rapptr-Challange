//
//  LoginViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit
public protocol SecondViewControllerDelegate: AnyObject {
    func navigateToFirstPage()
}
class LoginViewController: UIViewController {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Make the UI look like it does in the mock-up.
     *
     * 2) Take email and password input from the user
     *
     * 3) Use the endpoint and paramters provided in LoginClient.m to perform the log in
     *
     * 4) Calculate how long the API call took in milliseconds
     *
     * 5) If the response is an error display the error in a UIAlertController
     *
     * 6) If the response is successful display the success message AND how long the API call took in milliseconds in a UIAlertController
     *
     * 7) When login is successful, tapping 'OK' in the UIAlertController should bring you back to the main menu.
     **/
    
    // MARK: - Properties
    let alert = Alert()
    private var client = LoginClient()
    
    var loginView = LoginView()
    var loginViewModel: LoginViewModel?
    
    public weak var delegate: SecondViewControllerDelegate?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = loginView
        showTitle("Login")
        changeStatusColor()
        loginView.loginButton.addTarget(self, action: #selector(didPressLoginButton), for: .touchUpInside)
        
    }
    
    // MARK: - Actions
    
    @objc func naviagateToPrevious() {
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    
    @objc func didPressLoginButton() {
        
        guard let emailText = loginView.emailField.text else { return }
        guard let passwordText = loginView.passwordField.text else { return }
        
        client.login(email: emailText, password: passwordText) { (result: (Result<Int, NetworkError>)) in
            switch result {
            case .success(_):
                self.naviagateToPrevious()
            case .failure(let error):
                
                self.alert.showAlert(mesageTitle: "Error", messageDesc: "\(error): \(error.localizedDescription)", viewController: self){ _ in
                }
            }
        }
    }
}
