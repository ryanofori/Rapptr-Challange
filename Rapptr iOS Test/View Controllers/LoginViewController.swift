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
            attributes: [NSAttributedString.Key.foregroundColor : UIColor(hex: "#5F6063")])
        emailField.textColor = UIColor(hex: "#1B1E1F")
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
        passwordField.backgroundColor = .white.withAlphaComponent(0.4)
//        passwordField.placeholder = "Password"
        passwordField.attributedPlaceholder = NSAttributedString(
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor : UIColor(hex: "#5F6063")])
        passwordField.textColor = UIColor(hex: "#1B1E1F")
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
        button.addTarget(self, action: #selector(showStuff), for: .touchUpInside)
        return button
    }()
    
    //    @IBOutlet weak var loginButton: UIButton!
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Login"
        
        //        view.backgroundColor = UIColor(patternImage: UIImage(named: "img_login.png") ?? UIImage())
        //        view.insertSubview(backgroundImage, at: 0)
        [backgroundImage, emailField, passwordField, loginButton].forEach { view.addSubview($0) }
        
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        
        emailField.heightAnchor.constraint(equalToConstant: 55).isActive = true
        emailField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant:  64).isActive = true
        emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        
        passwordField.heightAnchor.constraint(equalToConstant: 55).isActive = true
        passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor,constant: 24).isActive = true
        passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        
        loginButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 24).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    @IBAction func backAction(_ sender: Any) {
        naviagateToPrevious()
    }
    
    func naviagateToPrevious() {
        let mainMenuViewController = MenuViewController()
        self.navigationController?.pushViewController(mainMenuViewController, animated: true)
    }
    
    @IBAction func didPressLoginButton(_ sender: Any) {
        //        NetworkManager.shared.getData(urlString: "", completion: <#T##(Data) -> Void#>)
        alert.showAlert(mesageTitle: "I did somethin", messageDesc: "I am here!", viewController: self)
    }
    @objc func showStuff() {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "mesageTitle", message: "messageDesc", preferredStyle: .actionSheet)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true) {
                print("I was pressed")
            }
        }
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
class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func getJSON<T:Decodable>(urlString: String, completion: @escaping (Result<T, NetworkError>) -> Void) {
            guard let url = URL(string: urlString) else {
                return completion(.failure(.invalidURL))
            }
            var request = URLRequest(url: url)
            let config = URLSessionConfiguration.default
            config.waitsForConnectivity = true
            let session = URLSession(configuration: config)
            request.httpMethod = "GET"
            let task = session.dataTask(with: request) { (data, response, error) in
                guard error == nil, let data = data else {
                    completion(.failure(.unknownError))
                    return
                }
                let decoder = JSONDecoder()
                let decodedData = try? decoder.decode(T.self, from: data)
                if decodedData == nil {
                    completion(.failure(.decodingError))
                } else {
                    completion(.success(decodedData!))
                }
                
            }
            task.resume()
        }
    
   
}

enum NetworkError: Error {
    case invalidURL
    case decodingError
    case unknownError
}
