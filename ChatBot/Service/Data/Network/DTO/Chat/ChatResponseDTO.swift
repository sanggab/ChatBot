//
//  ChatResponseDTO.swift
//  ChatGptBot
//
//  Created by Gab on 2023/03/27.
//

import Foundation


struct ChatResponseDTO: ResponseDTO {
    
    var data: Data
    
    init(data: Data?) throws {
        
        guard let data else {
            throw Exception.GuardBinding.none
        }
        
        self.data = data
    }
    
    
}

extension ChatResponseDTO {
    
    func toGPTModel() throws -> GPTModel {
        let gptModel = try JSONDecoder().decode(GPTModel.self, from: data)
        
        return gptModel
    }
    
    func toDomain() throws -> ChatEntity {
        let gptModel = try toGPTModel()
        
        let chatEntity: ChatEntity = ChatEntity(id: gptModel.id,
                                                date: (gptModel.created ?? Int(Date().timeIntervalSince1970)),
                                                message: gptModel.choices?.first?.message ?? Message(role: .system, content: "error"))
        
        return chatEntity
    }
}
