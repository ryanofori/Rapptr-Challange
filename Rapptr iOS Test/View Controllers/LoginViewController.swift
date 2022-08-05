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
    
    @IBOutlet weak var loginButton: UIButton!
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "img_login.png")
//        view.backgroundColor = UIColor(patternImage: UIImage(named: "img_login.png") ?? UIImage())
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
        loginButton.backgroundColor = UIColor(hex: "#0E5C89")
        loginButton.tintColor = .white
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    @IBAction func backAction(_ sender: Any) {
        let mainMenuViewController = MenuViewController()
        self.navigationController?.pushViewController(mainMenuViewController, animated: true)
    }
    
    @IBAction func didPressLoginButton(_ sender: Any) {
//        NetworkManager.shared.getData(urlString: "", completion: <#T##(Data) -> Void#>)
        alert.showAlert(mesageTitle: "I did somethin", messageDesc: "I am here!", viewController: self)
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}

class Alert {
    func showAlert(mesageTitle: String, messageDesc: String, viewController: UIViewController) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: mesageTitle, message: messageDesc, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            viewController.present(alertController, animated: true, completion: nil)
        }
            
    }
}
class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func getData(urlString: String, completion: @escaping(Data) -> Void) {
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            guard let data = data else { return }
            completion(data)
        }
        task.resume()
    }
    
    func postData(urlString: String, param: String, completion: @escaping([String: Any]) -> Void) {
        let param: String = param
        let data = param.data(using: .utf8)
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = data
        let task = URLSession.shared.dataTask(with: request, completionHandler: {data, response, error  in
            if let response = response {
                NSLog(response.description)
            }
            if let error = error {
                NSLog(error as? String ?? "")
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    completion(json ?? ["": (Any).self])
                } catch {
                    NSLog(error as? String ?? "")
                }
            }
        })
        task.resume()
    }
}
