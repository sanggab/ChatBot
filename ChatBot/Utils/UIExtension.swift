//
//  UIExtension.swift
//  ChatGptBot
//
//  Created by yeoboya-211221-05 on 2023/03/22.
//

import UIKit

extension UINavigationController: UINavigationBarDelegate, UIGestureRecognizerDelegate {
    static func defauleNavigation() -> UINavigationController{
        let navigation = UINavigationController()
            navigation.hidesBottomBarWhenPushed = true
            navigation.setToolbarHidden(true, animated: false)
            navigation.setNavigationBarHidden(true, animated: false)
        
        return navigation
    }
}

extension UIViewController {
    
    func showAlert(alertModel: AlertModel) {
        let alert = UIAlertController(title: alertModel.title, message: alertModel.message, preferredStyle: alertModel.alertStyle)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
}
