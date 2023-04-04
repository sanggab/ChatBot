//
//  Publisher.swift
//  ChatBot
//
//  Created by Gab on 2023/03/30.
//

import Foundation

public final class Publisher<Element>: Observable<Element>, ObserverType {
    
    private var observers = [Observer<Element>]()
    
    public func on(_ event: Event<Element>) {
        
        for observer in observers {
            DispatchQueue.main.async {
                observer.onCore(event)
            }
        }
        
    }
    
    private func remove() {
        self.observers.removeAll()
    }
    
    override func deliver(_ observer: Observer<Element>) {
        self.observers.append(observer)
    }
    
    deinit {
        self.remove()
        log.i("Observable deinit")
    }
    
}
