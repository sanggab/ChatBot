//
//  DefaultResourceRepository.swift
//  ChatBot
//
//  Created by Gab on 2023/04/04.
//

import Foundation

final class DefaultResourceRepository: ResourceRepository {
    
    func getChattingList() throws -> [ChatEntity] {
        
        let data = UserDefaultsManager.CHATTING_LIST
        
        let responseDTO = try ResourceResponseDTO(data: data)
        
        return try responseDTO.toChatDomain()
    }
    
    func getRemainText() throws -> String {
        
        let data = UserDefaultsManager.REMAIN_TEXT
        
        let responseDTO = try ResourceResponseDTO(data: data)
        
        return try responseDTO.toRemainText()
    }
    
    func saveChattingList(data: Data?) throws {
        
        let beforeCount = UserDefaultsManager.CHATTING_LIST?.count
        
        let afterCount = data?.count
        
        guard beforeCount != afterCount else {
            throw Exception.GuardBinding.match(data: "UserDefaultsManager.CHATTING_LIST")
        }
        
        UserDefaultsManager.CHATTING_LIST = data
        
    }
    
    func saveRemainText(data: Data?) throws {
        
        let beforeCount = UserDefaultsManager.REMAIN_TEXT?.count
        
        let afterCount = data?.count
        
        guard beforeCount != afterCount else {
            throw Exception.GuardBinding.match(data: "UserDefaultsManager.REMAIN_TEXT")
        }
        
        UserDefaultsManager.REMAIN_TEXT = data
        
    }
}
