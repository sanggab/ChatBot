//
//  ChatLayoutModel + Gesture.swift
//  ChatGptBot
//
//  Created by Gab on 2023/03/24.
//

import UIKit

extension ChatLayoutModel {
    
    @objc func didTapBackView(_ sender: UIGestureRecognizer) {
        self.delegate?.didTapBackView()
    }
    
    @objc func didTapSendMessage(_ sender: UIGestureRecognizer) {
        self.delegate?.didTapSendMessage()
    }
    
    @objc func didTapLayout(_ sender: UIGestureRecognizer) {
        self.layout.endEditing(true)
    }
}
