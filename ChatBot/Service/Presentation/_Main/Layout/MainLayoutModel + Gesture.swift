//
//  MainLayoutModel + headerview.swift
//  ChatGptBot
//
//  Created by yeoboya-211221-05 on 2023/03/23.
//

import UIKit
import PinLayout
import FlexLayout

// MARK: - Gesture Actions
extension MainLayoutModel {
    
    @objc func didTapMenuView(_ sender: UIGestureRecognizer) {
        log.i(#function)
        
        self.openMenuListView(false)
    }
    
    @objc func didTapMenuDimView(_ sender: UIGestureRecognizer) {
        log.i(#function)
        
        self.openMenuListView(true)
    }
    
    @objc func didTapProfileView(_ sender: UIGestureRecognizer) {
        log.i(#function)
        
        if let name = sender.name {
            self.delegate?.actions(name: name)
        } else {
            self.delegate?.actions(name: "")
        }
        
    }
    
    @objc func didTapChatBotView(_ sender: UIGestureRecognizer) {
        log.i(#function)
        
        if let name = sender.name {
            self.delegate?.actions(name: name)
        } else {
            self.delegate?.actions(name: "")
        }
        
    }
    
}
