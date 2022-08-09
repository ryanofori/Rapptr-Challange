//
//  LoginViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

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
    private var client: LoginClient?
    
    let alert = Alert()
    let loginClient = LoginClient()
    
    var loginView = LoginView()
    
    //    @IBOutlet weak var loginButton: UIButton!
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view = loginView
        title = "Login"
        changeStatusColor()
        loginView.loginButton.addTarget(self, action: #selector(didPressLoginButton), for: .touchUpInside)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    
    @objc func naviagateToPrevious() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func didPressLoginButton() {
        postRequest()
        //        loginClient.login(email: emailField.text ?? "" , password: passwordField.text ?? "", completion: <#T##(String) -> Void#>, error: <#T##(String?) -> Void#>)
        //        DispatchQueue.main.async {
        //            let alertController = UIAlertController(title: "mesageTitle", message: "messageDesc", preferredStyle: .actionSheet)
        //            alertController.addAction(UIAlertAction(title: "OK", style: .default,handler: {_ in
        //                self.naviagateToPrevious()
        //            }))
        //            self.present(alertController, animated: true)
        //        }
    }
    
    func postRequest(){
        let param = ["email": "info@rapptrlabs.com", "password": "Test123"]
        guard let url = URL(string: URLManager.loginURL.rawValue) else { return }
//        let postString = "email=info@rapptrlabs.com&password=Test123"
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.post.rawValue
        let postString = (param.compactMap{ "\($0)=\($1)"}).joined(separator: "&")
        request.httpBody = postString.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: {data, response, error  in
            if let response = response{
                print(response)
            }
            if let data = data {
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                }
                catch {
                    print(error)
                }
            }
        })
        task.resume()
    }
    
}

class Alert {
    func showAlert(mesageTitle: String, messageDesc: String, viewController: UIViewController) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: mesageTitle, message: messageDesc, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            viewController.present(alertController, animated: true, completion: nil)
        }
    }
}
