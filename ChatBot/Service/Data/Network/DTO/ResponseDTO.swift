//
//  ResponseDTO.swift
//  ChatBot
//
//  Created by Gab on 2023/04/04.
//

import Foundation

protocol ResponseDTO {
    var data: Data { get }
    
    init(data: Data?) throws
}
