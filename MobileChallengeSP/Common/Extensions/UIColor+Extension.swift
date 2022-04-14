//
//  UIColor+Extension.swift
//  MobileChallengeSP
//
//  Created by Waqas Naseem on 11/9/21.
//

import UIKit

extension UIColor {
    
    convenience init(hex: UInt32) {
        let mask = 0x000000FF
        // swiftlint:disable identifier_name
        let r = Int(hex >> 16) & mask
        let g = Int(hex >> 8) & mask
        let b = Int(hex) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
}
