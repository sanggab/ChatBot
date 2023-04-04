//
//  ChatURLRequest.swift
//  ChatGptBot
//
//  Created by Gab on 2023/03/27.
//

import Foundation

enum ChatURLRequest {
    
    static func sendMessage(dto: ChatRequestDTO) -> Endpoint<ChatResponseDTO> {
        
        let api = ChatAPI.sendMessage(dto.param)
        
        return Endpoint(urlRequest: api.getURLRequest())
    }
}
