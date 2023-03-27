//
//  ChatViewModel.swift
//  ChatGptBot
//
//  Created by yeoboya-211221-05 on 2023/03/24.
//

import Foundation

struct ChatActions {
    
    var didCloseTap: (() -> Void)?
}

protocol ChatViewModelInput {
    
    func closeChatBot()
    func sendMessage(text: String)
}

protocol ChatViewModelOutput {
    
}

protocol ChatViewModel: ChatViewModelInput, ChatViewModelOutput {}

class DefaultChatViewModel: ChatViewModel {
    
    static let model = "gpt-3.5-turbo"
    
    var actions: ChatActions
    var chatUseCase: FetchChatUseCase
    
    init(actions: ChatActions, chatUseCase: FetchChatUseCase) {
        self.actions     = actions
        self.chatUseCase = chatUseCase
    }
    
    deinit {
        log.i("DefaultChatViewModel deinit")
    }
}


// MARK: - ChatViewModelInput
extension DefaultChatViewModel {
    
    func closeChatBot() {
        log.i(#function)
        
        self.actions.didCloseTap?()
    }
    
    func sendMessage(text: String) {
        log.i(#function)
        
        let requestModel = getRequestBodyModel(message: .init(role: .user, content: text))
        
        self.chatUseCase.sendMessage(reqModel: requestModel, completion: { [weak self] (result) in
            
            guard let `self` = self else { return }
            
            switch result {
            case .success(let response):
                log.i(response)
            case .failure(let error):
                log.e(error)
            }
            
        })
    }
}

extension DefaultChatViewModel {
    
    func getRequestBodyModel(message: Message) -> RequestBodyModel {
        
        return RequestBodyModel(model: DefaultChatViewModel.model, messages: [message])
    }
}

// MARK: - ChatViewModelOutput
extension DefaultChatViewModel {
    
}
