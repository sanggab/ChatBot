//
//  ChatRepositories.swift
//  ChatGptBot
//
//  Created by yeoboya-211221-05 on 2023/03/24.
//

import Foundation

protocol ChatRepository {
    
    func sendMessage(reqModel: RequestBodyModel, completion: @escaping ((Result<ChatEntity, Error>) -> Void))
}
