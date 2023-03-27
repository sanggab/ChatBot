//
//  ChatURLRequest.swift
//  ChatGptBot
//
//  Created by Gab on 2023/03/27.
//

import Foundation

enum ChatURLRequest {
    
    static func sendMessage(dto: ChatRequestDTO) -> URLRequest {
        
        let api = ChatAPI.sendMessage(dto.param)
        
        return api.getURLRequest()
    }
}
