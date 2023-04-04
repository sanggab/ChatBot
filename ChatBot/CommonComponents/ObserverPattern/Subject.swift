//
//  Subject.swift
//  ChatBot
//
//  Created by Gab on 2023/03/30.
//

//import Foundation
//
//public final class Subject<Element>: Observable<Element>, ObserverType {
//    
//    private var observers: [Observer<Element>] = []
//    
//    public var value: Element {
//        didSet {
//            test()
//        }
//    }
//    
//    public init(value: Element) {
//        self.value = value
//    }
//    
//    public func on(_ event: Event<Element>) {
//        
//        for observer in observers {
//            DispatchQueue.main.async {
//                observer.onCore(event)
//            }
//        }
//    }
//
//    public func test() {
//        log.i("value -> \(value)")
//    }
//    
//    public func remove() {
//        self.observers.removeAll()
//    }
//    
//    override func deliver(_ observer: Observer<Element>) {
//        self.observers.append(observer)
//    }
//    
//    deinit {
//        self.remove()
//        log.i("Subject deinit")
//    }
//    
//}
