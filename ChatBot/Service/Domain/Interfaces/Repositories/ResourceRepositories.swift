//
//  ResourceRepositories.swift
//  ChatBot
//
//  Created by Gab on 2023/04/04.
//

import Foundation

protocol ResourceRepository {
    
    func getChattingList() throws -> [ChatEntity]
    func getRemainText() throws -> String
    
    func saveChattingList(data: Data?) throws
    func saveRemainText(data: Data?) throws
    
    
}
