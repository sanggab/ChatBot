//
//  ObverserType.swift
//  ChatBot
//
//  Created by Gab on 2023/03/30.
//

import Foundation

public protocol ObserverType {
    associatedtype Element
    
    func on(_ event: Event<Element>)
}

extension ObserverType {
    
    public func onNext(_ element: Element) {
        self.on(.next(element))
    }
    
    public func onCompleted() {
        self.on(.completed)
    }
    
    public func onError(_ error: Swift.Error) {
        self.on(.error(error))
    }
}

extension ObserverType {
    
    
}
