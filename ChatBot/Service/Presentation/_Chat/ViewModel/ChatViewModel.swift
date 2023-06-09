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

protocol ChatViewModelInit {
    func loadView()
}

protocol ChatViewModelInput {
    
    func closeChatBot()
    func sendMessage(text: String)
    func saveRemainText(text: String)
}

protocol ChatViewModelOutput {
    
    var _didListLoad: Publisher<Bool> { get }
    var _didRemainText: Publisher<String> { get }
}

protocol ChatViewModelVCHelper {
    typealias ChatListByDate = [String : [ChatEntity]]
    typealias ChatDate = [String]
    
    
    func getChatListByDate() -> ChatListByDate
    func getChatDate() -> ChatDate
}

protocol ChatViewModel: ChatViewModelInit, ChatViewModelInput, ChatViewModelOutput, ChatViewModelVCHelper {
    
}

class DefaultChatViewModel: ChatViewModel {
    
    static let model = "gpt-3.5-turbo"
    
    var actions: ChatActions
    var chatUseCase: FetchChatUseCase
    var resourceUseCase: FetchResourceUseCase
    
    var chatList: ChatListByDate = [:]
    var sectionList: ChatDate = []
    
    var dummy: [ChatEntity] = []
    
    var _didListLoad: Publisher<Bool> = .init()
    
    var _didRemainText: Publisher<String> = .init()
    
    init(actions: ChatActions, chatUseCase: FetchChatUseCase, resourceUseCase: FetchResourceUseCase) {
        self.actions            = actions
        self.chatUseCase        = chatUseCase
        self.resourceUseCase    = resourceUseCase
    }
    
    deinit {
        log.i("DefaultChatViewModel deinit")
    }
}

extension DefaultChatViewModel {
    
    func sortedToDummy() {
        
        do {
            
            let dic = try Dictionary(grouping: self.dummy, by: { (data) -> String in
                
                if let date = try data.date?.toString().makeLocalDate() {
                    
                    return date
                    
                } else {
                    
                    return "error"
                    
                }
                
            })
            
            self.chatList = dic
            self.sectionList = dic.keys.sorted(by: <)
            
            self._didListLoad.onNext(true)
            
        } catch {
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
        
        self.setMyRequest(text: text)
        
        let requestModel = getRequestBodyModel(message: .init(role: .user, content: text))
        
        self.chatUseCase.sendMessage(reqModel: requestModel, completion: { [weak self] (result) in
            
            guard let `self` = self else { return }
            
            switch result {
            case .success(let response):
                
                self.dummy.append(response)
                self.sortedToDummy()
                
                self.saveChatList()
                
            case .failure(let error):
                log.e(error)
            }
            
        })
    }
    
    
    func setMyRequest(text: String) {
        let chatList: ChatEntity = .init(id: "1", date: Int(Date().timeIntervalSince1970), message: .init(role: .user, content: text))
        
        self.dummy.append(chatList)
        
        self.sortedToDummy()
    }
    
    func saveChatList() {
        
        do {
            
            let chatData = try JSONEncoder().encode(self.dummy)
            
            try self.resourceUseCase.saveChattingList(data: chatData)
            
        } catch {
            log.e(error.localizedDescription)
        }
    }
    
    func saveRemainText(text: String) {
        
        do {
            
            let chatData = try JSONEncoder().encode(text)
            
            try self.resourceUseCase.saveRemainText(data: chatData)
            
        } catch {
            log.e(error.localizedDescription)
        }
    }
    
}

extension DefaultChatViewModel {
    
    func getRequestBodyModel(message: Message) -> RequestBodyModel {
        
        return RequestBodyModel(model: DefaultChatViewModel.model, messages: [message])
    }
    
    func getChattingModel(text: String) -> GPTModel {
        return .init(id: UUID().uuidString, object: nil, created: nil, usage: nil, choices: [Choices(message: .init(role: .user, content: text), finish_reason: "", index: 0)])
    }
}

// MARK: - ChatViewModelOutput
extension DefaultChatViewModel {
    
}


// MAKR: - Init
extension DefaultChatViewModel {
    
    func getRemainText() throws -> String {
        try self.resourceUseCase.getReaminText()
    }
    
    func loadView() {
        log.i(#function)
        
        do {
            
            try self._didRemainText.onNext(getRemainText())
            
            let chatList = try self.resourceUseCase.getChattingList()
            
            if !chatList.isEmpty {
                self.dummy.append(contentsOf: chatList)
            }
            
            self.sortedToDummy()
            
        } catch {
            log.e(error.localizedDescription)
        }
    }
}
