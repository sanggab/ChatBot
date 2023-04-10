//
//  FetchResourceUseCase.swift
//  ChatBot
//
//  Created by Gab on 2023/04/04.
//

import Foundation

protocol UpdateResourceUseCase {
    
    func saveChattingList(data: Data?) throws
    func saveRemainText(data: Data?) throws
}

protocol SearchResourceUseCase {
    
    func getChattingList() throws -> [ChatEntity]
    func getReaminText() throws -> String
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
    
    func saveChattingList(data: Data?) throws {
        try fetchResourceRepository.saveChattingList(data: data)
    }
    
    func saveRemainText(data: Data?) throws {
        try fetchResourceRepository.saveRemainText(data: data)
    }
}

// MARK: - Search
extension DefaultResourceUseCase {
    
    func getChattingList() throws -> [ChatEntity] {
        return try fetchResourceRepository.getChattingList()
    }
    
    func getReaminText() throws -> String {
        return try fetchResourceRepository.getRemainText()
    }
}
