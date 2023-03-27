//
//  MainURLRequest.swift
//  ChatGptBot
//
//  Created by yeoboya-211221-05 on 2023/03/24.
//

import Foundation

enum MainURLRequest {
    
    static func requestAPIKey(dto: MainRequestDTO) -> URLRequest {
        
        let api = MainAPI.fetchAPIKey(dto.param)
        
        return api.getURLRequest()
    }
}

