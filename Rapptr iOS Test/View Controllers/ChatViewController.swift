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
    private var client = ChatClient()
    
    var chatView = ChatView()
    var chatViewModel = ChatViewModel()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        chatView.chatViewModel = chatViewModel
        view = chatView
        changeStatusColor()
        showTitle("Chat")
        getChatData()
    }
    
    func getChatData() {
        client.fetchChatData(urlString: URLManager.messagesURL.rawValue, completion: { (result: Result<Messages, NetworkError>) in
            switch result {
            case .success(let messages):
                self.chatViewModel.messages = messages.messages
                DispatchQueue.main.async {
                    self.chatView.chatTableView.reloadData()
                }
            case .failure(let error):
                NSLog(error.localizedDescription)
            }
        })
    }
    
}
