//
//  ColorExtension.swift
//  ChatGptBot
//
//  Created by yeoboya-211221-05 on 2023/03/22.
//

import UIKit

extension UIColor {
    
    convenience init(redF: CGFloat, greenF: CGFloat, blueF: CGFloat, alpha: CGFloat) {
        self.init(red: redF / 255, green: greenF / 255, blue: blueF / 255, alpha: alpha)
    }
    
    static var gray32: UIColor {
        UIColor(redF: 32, greenF: 32, blueF: 32, alpha: 1)
    }
    
    static var graye1: UIColor {
        UIColor(redF: 225, greenF: 225, blueF: 225, alpha: 1)
    }
    
    static var warmGrey: UIColor {
        UIColor(redF: 112, greenF: 112, blueF: 112, alpha: 1)
    }
}
