//
//  Observer.swift
//  ChatBot
//
//  Created by Gab on 2023/03/28.
//

import Foundation

public struct Observer<Element> {
    typealias EventHandler = (Event<Element>) -> Void
    
    private let eventHandler: EventHandler
    
    init(_ eventHandler: @escaping EventHandler) {
        self.eventHandler = eventHandler
    }
    
    func onCore(_ event: Event<Element>) {
        self.eventHandler(event)
    }
    
}
