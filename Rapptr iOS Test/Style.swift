//
//  Style.swift
//  Rapptr iOS Test
//
//  Created by Ryan Ofori on 8/7/22.
//

import Foundation
import UIKit
struct Style {
    struct Fonts {
        static let headerText = UIFont.systemFont(ofSize: 17, weight: .semibold)
        static let buttonText = UIFont.systemFont(ofSize: 16, weight: .semibold)
        static let chatUserName = UIFont.systemFont(ofSize: 13, weight: .semibold)
        static let chatMessage = UIFont.systemFont(ofSize: 15, weight: .regular)
        static let loginPlaceholder = UIFont.systemFont(ofSize: 16, weight: .regular)
        static let loginFilled = UIFont.systemFont(ofSize: 16, weight: .regular)
    }
    struct Colors {
        static let HeaderTextColor = UIColor(hex: "#FFFFFF")
        static let ButtonTextColor = UIColor(hex: "#FFFFFF")
        static let ChatUserNameColor = UIColor(hex: "#1B1E1F")
        static let ChatMessageColor = UIColor(hex: "#1B1E1F")
        static let LoginPlaceholderColor = UIColor(hex: "#5F6063")
        static let LoginFilledColor = UIColor(hex: "#1B1E1F")
        
        static let BubbleColor = UIColor(hex: "#EFEFEF")
        
        static let headerBackground = UIColor(hex: "#0E5C89")
        static let buttonBackground = UIColor(hex: "#0E5C89")
        static let viewBackground = UIColor(hex: "#F9F9F9")
    }
}
