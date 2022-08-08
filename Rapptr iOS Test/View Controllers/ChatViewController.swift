//
//  ChatViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class ChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
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
    private var chat = [Datum]()
    
    var chatTableView = UITableView()
    
    // MARK: - Outlets
//    @IBOutlet weak var chatTable: UITableView!
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = UIColor(hex: "#F9F9F9")
        view.backgroundColor = UIColor(hex: "#F9F9F9")
        
        messages = [Message]()
//        configureTable(tableView: chatTable)
        title = "Chat"
        
        
        
//        chatTableView.frame = view.bounds
        [chatTableView].forEach { view.addSubview($0) }
        chatTableView.delegate = self
        chatTableView.dataSource = self
        
        chatTableView.backgroundColor = UIColor(hex: "#F9F9F9")
        chatTableView.separatorColor = .clear
        
        chatTableView.translatesAutoresizingMaskIntoConstraints = false
        chatTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        chatTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        chatTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        chatTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        chatTableView.register(ChatTableViewCell.self, forCellReuseIdentifier: "cell")
//        chatTableView.rowHeight = UITableView.automaticDimension
//        chatTableView.estimatedRowHeight = 200
//        chatTableView.rowHeight = 200
        
        
        // TODO: Remove test data when we have actual data from the server loaded
//        messages?.append(Message(testName: "James", withTestMessage: "Hey Guys!"))
//        messages?.append(Message(testName:"Paul", withTestMessage:"What's up?"))
//        messages?.append(Message(testName:"Amy", withTestMessage:"Hey! :)"))
//        messages?.append(Message(testName:"James", withTestMessage:"Want to grab some food later?"))
//        messages?.append(Message(testName:"Paul", withTestMessage:"Sure, time and place?"))
//        messages?.append(Message(testName:"Amy", withTestMessage:"YAS! I am starving!!!"))
//        messages?.append(Message(testName:"James", withTestMessage:"1 hr at the Local Burger sound good?"))
//        messages?.append(Message(testName:"Paul", withTestMessage:"Sure thing"))
//        messages?.append(Message(testName:"Amy", withTestMessage:"See you there :P"))
//        chatTable.reloadData()
        NetworkManager.shared.getJSON(urlString: "https://dev.rapptrlabs.com/Tests/scripts/chat_log.php") { (result: Result<Chat, NetworkError>) in
            switch result {
            case .success(let messages):
                self.chat = messages.data
                DispatchQueue.main.async {
                    self.chatTableView.reloadData()
                }
                print("it worled!!!")
//                for mesaage in messages.data {
//                    print(mesaage.name)
//                }
                
            case .failure(let error):
                print("Something bad went wrong????")
            }
        }
    }
    
    // MARK: - Private
//    private func configureTable(tableView: UITableView) {
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.register(UINib(nibName: "ChatTableViewCell", bundle: nil), forCellReuseIdentifier: "ChatTableViewCell")
//        tableView.tableFooterView = UIView(frame: .zero)
//    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chatTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ChatTableViewCell
        cell?.selectionStyle = .none
        
        cell?.headerName.text = chat[indexPath.row].name
        cell?.bubble.text = chat[indexPath.row].message
        cell?.profileImage.image = chat[indexPath.row].avatarURL.toImage
//        cell.textLabel?.text = "cat"
//        cell.header
//        var cell: ChatTableViewCell? = nil
//        guard let cell = cell else {
//            return UITableViewCell()
//        }

//        if cell == nil {
//            let nibs = Bundle.main.loadNibNamed("ChatTableViewCell", owner: self, options: nil)
//            cell = nibs?[0] as? ChatTableViewCell
//        }
//        cell?.setCellData(message: messages![indexPath.row])
//        cell.
//        return cell!
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chat.count
//        return messages?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // MARK: - IBAction
//    @IBAction func backAction(_ sender: Any) {
//        let mainMenuViewController = MenuViewController()
//        self.navigationController?.pushViewController(mainMenuViewController, animated: true)
//    }
}
