//
//  ChatView.swift
//  Rapptr iOS Test
//
//  Created by Ryan Ofori on 8/9/22.
//

import Foundation
import UIKit

class ChatView: UIView {
    var chatTableView = UITableView()
    var chatViewModel = ChatViewModel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = Style.Colors.viewBackground
        configureTable(tableView: chatTableView)
        chatTableView.translatesAutoresizingMaskIntoConstraints = false
        chatTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        chatTableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        chatTableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        chatTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    private func configureTable(tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: String(describing: ChatTableViewCell.self))
        tableView.backgroundColor = Style.Colors.viewBackground //UIColor(hex: "#F9F9F9")
        tableView.separatorColor = .clear
        [tableView].forEach { addSubview($0) }
    }
    
    
}
extension ChatView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = chatTableView.dequeueReusableCell(withIdentifier: String(describing: ChatTableViewCell.self)) as? ChatTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.setCellData(message: chatViewModel.messages[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatViewModel.messages.count
    }
}

extension ChatView: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
