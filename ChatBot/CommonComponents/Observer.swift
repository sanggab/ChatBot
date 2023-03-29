//
//  Observer.swift
//  ChatBot
//
//  Created by Gab on 2023/03/28.
//

import Foundation

public final class Observable<Element>: ObserverType {
    
    
}

public protocol ObserverType {
    associatedtype Element
    
}

extension ObserverType {
    
    public func onNext(_ element: Element) {
        
    }
}
