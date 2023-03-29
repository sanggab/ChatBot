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
    
    static var gray90: UIColor {
        UIColor(redF: 144, greenF: 144, blueF: 144, alpha: 1)
    }
    
    static var gray50: UIColor {
        UIColor(redF: 80, greenF: 80, blueF: 80, alpha: 1)
    }
    
    static var graye1: UIColor {
        UIColor(redF: 225, greenF: 225, blueF: 225, alpha: 1)
    }
    
    static var warmGrey: UIColor {
        UIColor(redF: 112, greenF: 112, blueF: 112, alpha: 1)
    }
    
    static var assistantName: UIColor {
        UIColor(redF:149, greenF: 104, blueF: 0, alpha: 1)
    }
    
    static var grayf1: UIColor {
        UIColor(redF: 241, greenF: 241, blueF: 241, alpha: 1)
    }
    
    static var primary450: UIColor {
        UIColor(redF: 255, greenF: 213, blueF: 46, alpha: 1)
    }
}
