//
//  Messages.swift
//  Rapptr iOS Test
//
//  Created by Ethan Humphrey on 8/11/21.
//

import Foundation

struct Messages: Codable {
    
    let messages: [Message]
    enum CodingKeys: String, CodingKey {
        case messages = "data"
        
    }
    
}
struct Message: Codable {
    
    let userID: String
    let name: String
    let avatarURL: String
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case name
        case avatarURL = "avatar_url"
        case message
    }
    
}
