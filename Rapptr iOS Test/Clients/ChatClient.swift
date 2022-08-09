//
//  ChatClient.swift
//  Rapptr iOS Test
//
//  Created by Ethan Humphrey on 8/11/21.
//

import Foundation

/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 * 1) Make a request to fetch chat data used in this app.
 *
 * 2) Using the following endpoint, make a request to fetch data
 *    URL: https://dev.rapptrlabs.com/Tests/scripts/chat_log.php
 *
 */

class ChatClient {
    //get
    var session: URLSession?
    
    func fetchChatData(urlString: String, completion: @escaping (Result<[Message],NetworkError>) -> Void) {
        guard let url = URL(string: urlString) else {
            return completion(.failure(.invalidURL))
        }
        var request = URLRequest(url: url)
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        let session = URLSession(configuration: config)
        request.httpMethod = HTTPMethod.get.rawValue
        let task = session.dataTask(with: request) { (data, response, error) in
            guard error == nil, let data = data else {
                completion(.failure(.unknownError))
                return
            }
            let decoder = JSONDecoder()
            let decodedData = try? decoder.decode([Message].self, from: data)
            if decodedData == nil {
                completion(.failure(.decodingError))
            } else {
                completion(.success(decodedData!))
            }
            
        }
        task.resume()
    }
}

//NetworkManager.shared.getJSON(urlString: URLManager.messagesURL.rawValue) { (result: Result<Chat, NetworkError>) in
//    switch result {
//    case .success(let messages):
//        self.messages = messages.messages
//        DispatchQueue.main.async {
//            self.chatTableView.reloadData()
//        }
//        print("it worled!!!")
////                for mesaage in messages.data {
////                    print(mesaage.name)
////                }
//
//    case .failure(let error):
//        print("\(error.localizedDescription)")
//    }
//}
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
        request.httpMethod = HTTPMethod.get.rawValue
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
