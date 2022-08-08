//
//  Chat.swift
//  Rapptr iOS Test
//
//  Created by Ryan Ofori on 8/7/22.
//

import Foundation
struct Chat: Codable {
    let data: [Datum]
    
}
struct Datum: Codable {
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
