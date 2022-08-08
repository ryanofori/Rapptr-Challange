//
//  ChatTableViewCell.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class ChatTableViewCell: UITableViewCell {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Setup cell to match mockup
     *
     * 2) Include user's avatar image
     **/
    
    // MARK: - Outlets
    //    @IBOutlet weak var header: UILabel!
    //    @IBOutlet weak var body: UILabel!
    //    var profileImage: UIImageView?
    //    var headerName: UILabel?
    //    var messsageBody: UILabel?
    
    let profileImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
//        image.layer.cornerRadius = image.frame.size.width/2 //doesn't work
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let headerName: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        name.textColor = UIColor(hex: "#1B1E1F")
        return name
    }()
    let messsageBody: UILabel = {
        let body = UILabel()
        body.translatesAutoresizingMaskIntoConstraints = false
        body.numberOfLines = 0
        body.layer.cornerRadius = 8
        body.layer.masksToBounds = true
        body.layer.borderWidth = 1
        body.lineBreakMode = .byWordWrapping
        body.baselineAdjustment = .none
        body.layer.borderColor = UIColor.gray.cgColor
        body.backgroundColor = .white
        return body
    }()
    
    let bubble: UITextView = {
        let body = UITextView()
        body.translatesAutoresizingMaskIntoConstraints = false
        body.layer.masksToBounds = true
        body.layer.borderWidth = 1
        body.layer.borderColor = UIColor(hex: "#EFEFEF")?.cgColor
        body.layer.cornerRadius = 8
        body.textContainerInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        body.isScrollEnabled = false
        body.isEditable = false
        body.font = UIFont.systemFont(ofSize: 15)
        body.textContainer.lineBreakMode = .byWordWrapping
        body.backgroundColor = .white
        return body
    }()
    
    //used for instatiaing and dequeing cell
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        [profileImage, headerName, /*messsageBody,*/ bubble].forEach { contentView.addSubview($0) }
        
        contentView.backgroundColor = UIColor(hex: "#F9F9F9")
        profileImage.backgroundColor = .orange
        
        profileImage.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 16).isActive = true
        profileImage.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 16).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 35).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        headerName.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 16).isActive = true
        headerName.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 7).isActive = true
        headerName.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -36).isActive = true
        
        bubble.topAnchor.constraint(equalTo: headerName.bottomAnchor, constant: 4).isActive = true
        bubble.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 7).isActive = true
        bubble.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -36).isActive = true
        bubble.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor, constant: -8).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Public
//        func setCellData(message: Message) {
//            header.text = message.username
//            body.text = message.text
//            headerName.text = message.username
//            bubble.text = message.text
//        }
}
