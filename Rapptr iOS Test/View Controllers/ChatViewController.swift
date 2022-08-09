//
//  ChatViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class ChatViewController: UIViewController/*, UITableViewDataSource, UITableViewDelegate */{
    
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
    
    var chatTableView = UITableView()
    
    // MARK: - Outlets
//    @IBOutlet weak var chatTable: UITableView!
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view = chatView
        changeStatusColor()
        view.backgroundColor = Style.Colors.viewBackground//UIColor(hex: "#F9F9F9")
        
//        configureTable(tableView: chatTableView)
        title = "Chat"
//        chatTableView.frame = view.bounds
        
//        chatTableView.translatesAutoresizingMaskIntoConstraints = false
//        chatTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
//        chatTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        chatTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        chatTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
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
    
    // MARK: - Private
//    private func configureTable(tableView: UITableView) {
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: String(describing: ChatTableViewCell.self))
//        tableView.backgroundColor = Style.Colors.viewBackground //UIColor(hex: "#F9F9F9")
//        tableView.separatorColor = .clear
//        [tableView].forEach { view.addSubview($0) }
////        tableView.tableFooterView = UIView(frame: .zero)
//    }
}

//extension ChatViewController: UITableViewDataSource {
//    // MARK: - UITableViewDataSource
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let messages = messages else { return UITableViewCell() }
//        guard let cell = chatTableView.dequeueReusableCell(withIdentifier: String(describing: ChatTableViewCell.self)) as? ChatTableViewCell else { return UITableViewCell() }
//        cell.selectionStyle = .none
//        cell.setCellData(message: messages[indexPath.row])
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        guard let messages = messages else { return 0 }
//        return messages.count
//    }
//}
//
//extension ChatViewController: UITableViewDelegate{
//    // MARK: - UITableViewDelegate
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
//}
