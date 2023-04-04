//
//  Observable.swift
//  ChatBot
//
//  Created by Gab on 2023/03/31.
//

import Foundation

public class Observable<Element>: ObservableType {

    func deliver(_ observer: Observer<Element>) {
        log.i(observer)
    }
}
