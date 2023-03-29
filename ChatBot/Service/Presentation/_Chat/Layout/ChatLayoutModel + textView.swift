//
//  ChatLayoutModel + textView.swift
//  ChatBot
//
//  Created by Gab on 2023/03/28.
//

import UIKit

extension ChatLayoutModel: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.setFocus()
    }
    
    func textViewDidChange(_ textView: UITextView) {
        
    }
    
    func setFocus() {
        
        let textView = self.layout.inputBarView.textView
        
        if let inputText = textView.text, inputText == "Enter Messages" {
            self.layout.inputBarView.clearInputText()
        }
        
        self.layout.inputBarView.isFocus()
        
        if !textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            self.layout.inputBarView.isEnabledSendImage(true)
        }
    }
}
