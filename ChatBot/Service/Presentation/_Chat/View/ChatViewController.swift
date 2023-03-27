//
//  ChatViewController.swift
//  ChatGptBot
//
//  Created by yeoboya-211221-05 on 2023/03/24.
//

import UIKit


class ChatViewController: UIViewController {
    
    var viewModel: ChatViewModel!
    var layoutModel: ChatLayoutModel!
    
    class func create(viewModel: ChatViewModel) -> ChatViewController {
        let vc = ChatViewController()
            vc.viewModel = viewModel
        
        let layout = ChatLayoutModel()
            vc.layoutModel = layout
        
        return vc
    }
    
    override func loadView() {
        log.i(#function)
        self.view = layoutModel.layout
        
        layoutModel.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        log.i(#function)
        
        setDelegate()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        log.i(#function)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        log.i(#function)
    }
    
    func setDelegate() {
        self.layoutModel.delegate = self
    }
    
    deinit {
        log.i("ChatViewController deinit")
    }
}

extension ChatViewController: ChatLayoutModelProtocol {
    
    func didTapBackView() {
        self.viewModel.closeChatBot()
    }
    
    func didTapSendMessage() {
        self.viewModel.sendMessage(text: "반가워요!!")
    }
}
