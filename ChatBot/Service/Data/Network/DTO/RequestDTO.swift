//
//  RequestDTO.swift
//  ChatBot
//
//  Created by Gab on 2023/04/04.
//

import Foundation

protocol Responsable {
    associatedtype Response
}

protocol RequestDTO: Responsable {
    var urlRequest: URLRequest { get }
}

struct Endpoint<T>: RequestDTO {
    typealias Response = T
    
    var urlRequest: URLRequest
    
    init(urlRequest: URLRequest) {
        self.urlRequest = urlRequest
    }
}
