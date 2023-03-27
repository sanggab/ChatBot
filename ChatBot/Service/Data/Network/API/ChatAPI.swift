//
//  ChatAPI.swift
//  ChatGptBot
//
//  Created by Gab on 2023/03/27.
//

import Foundation


enum ChatAPI {
    case sendMessage(APIParameter)
}

extension ChatAPI: APITargetType {
    
    var baseURL: URL {
        switch self {
        case .sendMessage:
            return URL(string: "https://api.openai.com/v1/chat/completions")!
        }
    }
    
    var path: String {
        switch self {
        case .sendMessage:
            return ""
        }
    }
    
    var method: Method {
        switch self {
        case .sendMessage:
            return .post
        }
    }
    
    var body: Data? {
        switch self {
        case .sendMessage(let param):
            return try? JSONSerialization.data(withJSONObject: param, options: .prettyPrinted)
        }
    }
    
    var headers: [String : String]? {
        return [
            "Content-Type" : "application/json",
            "Authorization" : "Bearer "
        ]
    }
    
    
}
