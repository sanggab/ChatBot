//
//  FetchMainUseCase.swift
//  ChatGptBot
//
//  Created by yeoboya-211221-05 on 2023/03/23.
//

import UIKit

// MARK: -
protocol UpdateMainUseCase {
    
}

// MARK: -
protocol SearchMainUseCase {
    
    func getAPIKey(param: [String : Any], completion: @escaping ((Result<Any, Error>) -> Void))
    
}

protocol FetchMainUseCase: UpdateMainUseCase, SearchMainUseCase { }

class DefaultMainUseCase: FetchMainUseCase {
    
    var fetchMainRepository: MainRepository
    
    init(repository: MainRepository) {
        self.fetchMainRepository = repository
    }
}

// MARK: - Update
extension DefaultMainUseCase {
    
}

// MARK: - Search
extension DefaultMainUseCase {
    
    func getAPIKey(param: [String : Any], completion: @escaping ((Result<Any, Error>) -> Void)) {
        fetchMainRepository.fetchAPIKey(param: param, completion: completion)
    }
}
