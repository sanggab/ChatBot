//
//  DefaultResourceRepository.swift
//  ChatBot
//
//  Created by Gab on 2023/04/04.
//

import Foundation

final class DefaultResourceRepository: ResourceRepository {
    
    func getChattingList() -> [ChatEntity] {
        
        let data = UserDefaultsManager.CHATTING_LIST
        
        let test = try? JSONDecoder().decode([ChatEntity].self, from: data ?? Data())
        
        return test ?? []
    }
    
    func getRemainText() -> String {
        
        return ""
    }
    
    func saveChattingList(data: Data?) -> Bool {
        
        let beforeCount = UserDefaultsManager.CHATTING_LIST?.count
        
        UserDefaultsManager.CHATTING_LIST = data
        
        let afterCount = UserDefaultsManager.CHATTING_LIST?.count
        
        return beforeCount != afterCount
    }
    
    func saveRemainText(data: Data?) -> Bool {
        
        return true
    }
}
