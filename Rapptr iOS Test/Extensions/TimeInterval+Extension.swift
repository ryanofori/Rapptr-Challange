//
//  TimeInterval+Extension.swift
//  Rapptr iOS Test
//
//  Created by Ryan Ofori on 8/10/22.
//

import Foundation
extension TimeInterval {    
    var millisecond: Int {
            Int((self*1000).truncatingRemainder(dividingBy: 1000))
        }
}
