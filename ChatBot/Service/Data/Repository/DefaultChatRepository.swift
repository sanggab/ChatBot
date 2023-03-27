//
//  DefaultChatRepository.swift
//  ChatGptBot
//
//  Created by yeoboya-211221-05 on 2023/03/24.
//

import Foundation

final class DefaultChatRepository: ChatRepository {
    
    func sendMessage(reqModel: RequestBodyModel, completion: @escaping ((Result<Chatting, Error>) -> Void)) {
        
        let requestDTO = ChatRequestDTO(param: reqModel.toDictionary ?? [:])

        let urlRequest = ChatURLRequest.sendMessage(dto: requestDTO)

        SessionManager.responseDecodable(request: urlRequest, type: Chatting.self, completion: completion)

    }
}
