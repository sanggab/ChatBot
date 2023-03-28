//
//  ChatLayoutModel + Keyboard.swift
//  ChatBot
//
//  Created by Gab on 2023/03/28.
//

import UIKit
import PinLayout

extension ChatLayoutModel {
    
    func addKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    /// 키보드 올리기
    @objc func keyboardWillShow(_ sender: Notification) {
        
        guard let userInfo = sender.userInfo else {
            return
        }
        
        guard let curve = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else {
            return
        }
        
        guard let keyboardAnimationDuration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {
            return
        }
        
        let keyboardAnimationOptions = UIView.AnimationOptions(rawValue: curve << 16)
        
        if let keyboardSize = (sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            UIView.animate(withDuration: keyboardAnimationDuration, delay: 0, options: keyboardAnimationOptions, animations: { [weak self] in
                
                guard let `self` = self else { return }
                
                let constant = keyboardSize.height - self.layout.safeAreaInsets.bottom
                
                self.layout.inputBarView.pin.bottom(constant)
                
                self.layout.layoutIfNeeded()
            })
        }
        
    }
    
    /// 키보드 내리기
    @objc func keyboardWillHide(_ sender: Notification) {
        
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            
            guard let `self` = self else { return }
            
            if let keyboardSize = (sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                
                self.layout.inputBarView.pin.bottom()
                
                self.layout.layoutIfNeeded()
            }
        })
    }
}
