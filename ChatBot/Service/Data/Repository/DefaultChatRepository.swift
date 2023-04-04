//
//  DefaultChatRepository.swift
//  ChatGptBot
//
//  Created by yeoboya-211221-05 on 2023/03/24.
//

import Foundation

final class DefaultChatRepository: ChatRepository {
    
    func sendMessage(reqModel: RequestBodyModel, completion: @escaping ((Result<ChatEntity, Error>) -> Void)) {
        
        let requestDTO = ChatRequestDTO(param: reqModel.toDictionary ?? [:])

        let urlRequest = ChatURLRequest.sendMessage(dto: requestDTO)
        
        SessionManager.responseData(request: urlRequest) { result in
            
            do {
                
                switch result {
                case .success(let response):
                    completion(.success(try response.toDomain()))
                case .failure(let error):
                    throw error
                }
                
            } catch {
                completion(.failure(error))
            }
            
        }

    }
}
