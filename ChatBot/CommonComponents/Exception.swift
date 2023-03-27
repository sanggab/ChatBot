//
//  Exception.swift
//  ChatGptBot
//
//  Created by yeoboya-211221-05 on 2023/03/24.
//

import Foundation

enum Exception {
    
    case message(msg: String)
    
    enum NetWork {
        case result(statusCode: String, msg: String)
    }
    
    enum GuardBinding {
        case none
        case casting(data: Any)
        case match(data: Any)
    }
    
    
}

extension Exception: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .message(let msg):
            return msg
        }
    }
}


extension Exception.NetWork: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .result(let statusCode, let msg):
            return statusCode + " " + msg
        }
    }
}

extension Exception.GuardBinding: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .none:
            return "data is nil"
            
        case .casting(let data):
            return "Fail Type casting -> \(data)"
            
        case .match(let data):
            return "Not Match -> \(data)"
        }
    }
}
