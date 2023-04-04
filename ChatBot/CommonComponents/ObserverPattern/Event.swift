//
//  Event.swift
//  ChatBot
//
//  Created by Gab on 2023/03/30.
//

import Foundation

public enum Event<Element> {
    case next(Element)
    
    case error(Swift.Error)
    
    case completed
}

extension Event {
    
    public var element: Element? {
        if case .next(let element) = self {
            return element
        }
        return nil
    }
    
    public var error: Swift.Error? {
        if case .error(let error) = self {
            return error
        }
        return nil
    }
    
    public var isCompleted: Bool {
        if case .completed = self {
            return true
        }
        return false
    }
    
}
