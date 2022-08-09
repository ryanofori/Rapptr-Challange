//
//  UIColor+Extension.swift
//  Rapptr iOS Test
//
//  Created by Ryan Ofori on 8/1/22.
//

import UIKit
extension UIColor {
    
    public convenience init?(hex:String) {
        var hexValue:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (hexValue.hasPrefix("#")) {
            hexValue.remove(at: hexValue.startIndex)
        }
        
        if (hexValue.count == 6) {
            var rgbValue:UInt64 = 0
            Scanner(string: hexValue).scanHexInt64(&rgbValue)
            self.init(
                red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                alpha: CGFloat(1.0)
                
            )
            return
        }
        return nil
    }
}
