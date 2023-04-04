//
//  ResourceRepositories.swift
//  ChatBot
//
//  Created by Gab on 2023/04/04.
//

import Foundation

protocol ResourceRepository {
    
    func getChattingList() -> [ChatEntity]
    func getRemainText() -> String
    
    func saveChattingList(data: Data?) -> Bool
    func saveRemainText(data: Data?) -> Bool
    
    
}
