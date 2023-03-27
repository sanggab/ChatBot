//
//  FetchChatUseCase.swift
//  ChatGptBot
//
//  Created by yeoboya-211221-05 on 2023/03/24.
//

import Foundation


protocol UpdateChatUseCase {
    
    func sendMessage(reqModel: RequestBodyModel, completion: @escaping ((Result<Chatting, Error>) -> Void))
}

protocol SearchChatUseCase {
    
}

protocol FetchChatUseCase: UpdateChatUseCase, SearchChatUseCase {}

class DefaultChatUseCase: FetchChatUseCase {
    
    var fetchChatRepository: ChatRepository
    
    init(repository: ChatRepository ) {
        self.fetchChatRepository = repository
        
    }
}

// MARK: - Update
extension DefaultChatUseCase {
    
    func sendMessage(reqModel: RequestBodyModel, completion: @escaping ((Result<Chatting, Error>) -> Void)) {
        fetchChatRepository.sendMessage(reqModel: reqModel, completion: completion)
    }
}

// MARK: - Search
extension DefaultChatUseCase {
    
}
