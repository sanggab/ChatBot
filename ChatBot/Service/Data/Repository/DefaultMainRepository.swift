//
//  DefaultMainRepository.swift
//  ChatGptBot
//
//  Created by yeoboya-211221-05 on 2023/03/23.
//

import Foundation

final class DefaultMainRepository: MainRepository {
    
    func fetchAPIKey(param: [String : Any], completion: @escaping ((Result<Any, Error>) -> Void)) {
        log.i(#function)
        
        let requestDTO = MainRequestDTO(param: param)
        
        let urlRequest = MainURLRequest.requestAPIKey(dto: requestDTO)
        
        SessionManager.response(request: urlRequest, completion: completion)
    }
    
}
