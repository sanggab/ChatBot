//
//  ObservableType.swift
//  ChatBot
//
//  Created by Gab on 2023/03/31.
//

import Foundation

public protocol ObservableConvertibleType {
    associatedtype Element
    
    
}

protocol ObservableType: ObservableConvertibleType {
    
    func deliver(_ observer: Observer<Element>)
}

extension ObservableType {
    
    
}

extension ObservableType {
    
    public func subscribe(
        onNext: ((Element) -> Void)? = nil,
        onError: ((Swift.Error) -> Void)? = nil,
        onCompleted: (() -> Void)? = nil
    ) {
        
        let observer = Observer<Element> { event in
            
            switch event {
            case .next(let value):
                onNext?(value)
            case .error(let error):
                onError?(error)
            case .completed:
                onCompleted?()
            }
        }
        
        self.deliver(observer)
    }
    
}
