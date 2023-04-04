//
//  ResourceResponseDTO.swift
//  ChatBot
//
//  Created by Gab on 2023/04/04.
//

import Foundation

struct ResourceResponseDTO: ResponseDTO {
    
    var data: Data
    
    init(data: Data?) throws {
        
        guard let data else {
            throw Exception.GuardBinding.none
        }
        
        self.data = data
        
    }
    
    
}
