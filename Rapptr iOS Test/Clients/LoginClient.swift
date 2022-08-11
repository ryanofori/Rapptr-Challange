//
//  LoginClient.swift
//  Rapptr iOS Test
//
//  Created by Ethan Humphrey on 8/11/21.
//

import Foundation

/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 * 1) Make a request here to login.
 *
 * 2) Using the following endpoint, make a request to login
 *    URL: https://dev.rapptrlabs.com/Tests/scripts/login.php
 *
 * 3) Don't forget, the endpoint takes two parameters 'email' and 'password'
 *
 * 4) email - info@rapptrlabs.com
 *   password - Test123
 *
*/

class LoginClient {
    
    var loginViewModel = LoginViewModel()
    
    func login(email: String, password: String, completion: @escaping (Result<Int, NetworkError>) -> Void) {
        guard let url = URL(string: URLManager.loginURL.rawValue)else { return }
        
        var param = ["email": email, "password": password]
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.post.rawValue
        
        let postString = (param.compactMap{ "\($0)=\($1)"}).joined(separator: "&")
        request.httpBody = postString.data(using: .utf8)
        
        let start : TimeInterval = NSDate.timeIntervalSinceReferenceDate
        let task = URLSession.shared.dataTask(with: request, completionHandler: {data, response, error  in
            if let error = error {
                completion(.failure(.unknownError))
            }
            if let response = response{
                NSLog("\(response)")
            }
            if let data = data {
                do{
                    self.loginViewModel.loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                    let timeResponse : TimeInterval = NSDate.timeIntervalSinceReferenceDate - start
                    completion(.success(timeResponse.millisecond))
                }
                catch {
                    completion(.failure(.badData))
                }
            }
        })
        task.resume()
    }
}
