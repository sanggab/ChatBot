//
//  MainRepositories.swift
//  ChatGptBot
//
//  Created by yeoboya-211221-05 on 2023/03/23.
//

import Foundation

protocol MainRepository {
    
    func fetchAPIKey(param: [String : Any], completion: @escaping ((Result<Any, Error>) -> Void))
}
