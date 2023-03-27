//
//  RequestBodyModel.swift
//  ChatGptBot
//
//  Created by Gab on 2023/03/27.
//

import Foundation

struct RequestBodyModel: Codable {

    let model: String
    
    let messages: [Message]
    
    internal init(model: String, messages: [Message]) {
        self.model = model
        self.messages = messages
    }
}
