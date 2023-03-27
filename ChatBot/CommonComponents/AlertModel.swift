//
//  AlertModel.swift
//  ChatGptBot
//
//  Created by yeoboya-211221-05 on 2023/03/24.
//

import UIKit

struct AlertModel {
    
    let title: String
    let message: String
    let alertStyle: UIAlertController.Style
    
    init(title: String, message: String, alertStyle: UIAlertController.Style) {
        self.title = title
        self.message = message
        self.alertStyle = alertStyle
    }
}

