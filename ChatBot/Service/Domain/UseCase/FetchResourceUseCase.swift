//
//  FetchResourceUseCase.swift
//  ChatBot
//
//  Created by Gab on 2023/04/04.
//

import Foundation

protocol UpdateResourceUseCase {
    
    @discardableResult
    func saveChattingList(data: Data?) -> Bool
    
    @discardableResult
    func saveRemainText(data: Data?) -> Bool
}

protocol SearchResourceUseCase {
    
    func getChattingList() -> [ChatEntity]
    func getReaminText() -> String
}

protocol FetchResourceUseCase: UpdateResourceUseCase, SearchResourceUseCase {}

class DefaultResourceUseCase: FetchResourceUseCase {
    
    var fetchResourceRepository: ResourceRepository
    
    init(repository: ResourceRepository) {
        self.fetchResourceRepository = repository
    }
}

// MARK: - Update
extension DefaultResourceUseCase {
    
    @discardableResult
    func saveChattingList(data: Data?) -> Bool {
        return fetchResourceRepository.saveChattingList(data: data)
    }
    
    @discardableResult
    func saveRemainText(data: Data?) -> Bool {
        return fetchResourceRepository.saveRemainText(data: data)
    }
}

// MARK: - Search
extension DefaultResourceUseCase {
    
    func getChattingList() -> [ChatEntity] {
        return fetchResourceRepository.getChattingList()
    }
    
    func getReaminText() -> String {
        return fetchResourceRepository.getRemainText()
    }
}
