//
//  ChatInputBarView.swift
//  ChatGptBot
//
//  Created by Gab on 2023/03/27.
//

import UIKit
import PinLayout
import FlexLayout

class ChatInputBarView: UIView {
    
    let mainView: UIView = {
        let view = UIView()
            view.backgroundColor = .systemGreen
        
        return view
    }()
    
    let mediaImageView: UIImageView = {
        let imageView = UIImageView()
            imageView.image = .btnMediaPlus
        
        return imageView
    }()
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 15)
        textView.textColor = .warmGrey
        textView.textContainerInset = .zero
        textView.backgroundColor = .white
        textView.isScrollEnabled = false
        textView.text = "Enter Messages"
        
        return textView
    }()
    
    let sendImageView: UIImageView = {
        let imageView = UIImageView()
            imageView.image = .btnSendDisabled
            imageView.isUserInteractionEnabled = true
        
        return imageView
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setConstraints()
    }
    
    func setLayout() {
        self.addSubview(mainView)
        
        mainView.flex
            .direction(.row)
            .paddingVertical(6)
            .define { flex in
                
                flex.addItem()
                    .padding(11)
                    .backgroundColor(.systemOrange)
                    .define { flex in
                        
                        flex.addItem(mediaImageView)
                    }
                
                flex.addItem()
                    .width(100%)
                    .shrink(1)
                    .marginVertical(2)
                    .padding(9, 16, 10, 16)
                    .cornerRadius(8)
                    .backgroundColor(.systemBlue)
                    .define { flex in
                        
                        flex.addItem(textView)
                    }
                
                flex.addItem()
                    .size(44)
                    .padding(9)
                    .backgroundColor(.systemGray)
                    .define { flex in
                        
                        flex.addItem(sendImageView)
                    }
                
            }
    }
    
    func setConstraints() {
        mainView.pin.all()
        
        mainView.flex.layout()
    }
    
    func clearInputText() {
        
        self.textView.text = ""
    }
    
    func isFocus() {
        
        textView.textColor = .gray32
    }
    
    func isEnabledSendImage(_ state: Bool) {
        
        self.sendImageView.image = state == true ? .btnSend : .btnSendDisabled
    }
    
    deinit {
        log.i("ChatInputBarView deinit")
    }
}
