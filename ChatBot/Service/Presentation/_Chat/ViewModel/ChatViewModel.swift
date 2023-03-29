//
//  ChatViewModel.swift
//  ChatGptBot
//
//  Created by yeoboya-211221-05 on 2023/03/24.
//

import Foundation
import Combine

struct ChatActions {
    
    var didCloseTap: (() -> Void)?
}

protocol ChatViewModelInput {
    
    func closeChatBot()
    func sendMessage(text: String)
}

protocol ChatViewModelOutput {
    
}

protocol ChatViewModel: ChatViewModelInput, ChatViewModelOutput {
    
}

class DefaultChatViewModel: ChatViewModel {
    
    static let model = "gpt-3.5-turbo"
    
    var actions: ChatActions
    var chatUseCase: FetchChatUseCase
    
    var chatListByDate: [String : [Chatting]] = [:]
    var chatDate: [String] = []
    
    var dummy: [Chatting] = []
    
    var _testOutput: Observable<String> = .init()

    init(actions: ChatActions, chatUseCase: FetchChatUseCase) {
        self.actions     = actions
        self.chatUseCase = chatUseCase
    }
    
    deinit {
        log.i("DefaultChatViewModel deinit")
    }
}

extension DefaultChatViewModel {
    
    func sortedToDummy() {
        
        do {
            
            
            
        } catch {
            log.e(error)
            log.e(error.localizedDescription)
        }
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
    
    func setMyRequest(text: String) {
        let chatting: Chatting = self.getChattingModel(text: text)
        
        self.dummy.append(chatting)
    }
}

extension DefaultChatViewModel {
    
    func getRequestBodyModel(message: Message) -> RequestBodyModel {
        
        return RequestBodyModel(model: DefaultChatViewModel.model, messages: [message])
    }
    
    func getChattingModel(text: String) -> Chatting {
        return .init(id: UUID().uuidString, object: nil, created: nil, usage: nil, choices: [Choices(message: .init(role: .user, content: text), finish_reason: "", index: 0)])
    }
}

// MARK: - ChatViewModelOutput
extension DefaultChatViewModel {
    
}
