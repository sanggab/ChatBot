//
//  ChatLayoutModel.swift
//  ChatGptBot
//
//  Created by yeoboya-211221-05 on 2023/03/24.
//

import UIKit
import PinLayout
import FlexLayout

protocol ChatLayoutModelProtocol: AnyObject {
    
    func didTapBackView()
    func didTapSendMessage()
}

class ChatLayoutModel: NSObject {
    
    let layout = ChatMainLayout(frame: .zero)
    
    weak var delegate: ChatLayoutModelProtocol?
    
    func loadView() {
        
        bind()
        setDelegate()
        addKeyboardNotification()
    }
    
    func bind() {
        
        layoutBind()
        headerViewBind()
        inputBarViewBind()
    }
    
    func layoutBind() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapLayout))
        layout.addGestureRecognizer(tap)
    }
    
    func headerViewBind() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapBackView))
        layout.headerView.backView.addGestureRecognizer(tap)
           
    }
    
    func inputBarViewBind() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapSendMessage))
        layout.inputBarView.sendImageView.addGestureRecognizer(tap)
    }
    
    func setDelegate() {
        layout.inputBarView.textView.delegate = self
    }

    deinit {
        log.i("ChatLayoutModel deinit")
    }
}
