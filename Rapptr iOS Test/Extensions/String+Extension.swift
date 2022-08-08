//
//  String+Extension.swift
//  Rapptr iOS Test
//
//  Created by Ryan Ofori on 8/7/22.
//

import UIKit
extension String {
    var toImage: UIImage {
        if let imageURL = URL(string: self) {
            if let data = try? Data(contentsOf: imageURL) {
                let image = UIImage(data: data)
                if let imageData = image {
                    return imageData
                }
                return UIImage()
            }
        }
        return UIImage()
    }
}
