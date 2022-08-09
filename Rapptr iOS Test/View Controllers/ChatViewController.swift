//
//  ChatViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class ChatViewController: UIViewController {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Make the UI look like it does in the mock-up.
     *
     * 2) Using the following endpoint, fetch chat data
     *    URL: http://dev.rapptrlabs.com/Tests/scripts/chat_log.php
     *
     * 3) Parse the chat data using 'Message' model
     *
     **/
    
    // MARK: - Properties
    private var client: ChatClient?
    private var messages: [Message]?
    
    var chatView = ChatView()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view = chatView
        changeStatusColor()
        showTitle("Chat")
        
        NetworkManager.shared.getJSON(urlString: URLManager.messagesURL.rawValue) { (result: Result<Messages, NetworkError>) in
            switch result {
            case .success(let messages):
                self.chatView.messages = messages.messages
                DispatchQueue.main.async {
                    self.chatView.chatTableView.reloadData()
                }
                print("it worled!!!")
//                for mesaage in messages.data {
//                    print(mesaage.name)
//                }
                
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
        }
    }
    
}
