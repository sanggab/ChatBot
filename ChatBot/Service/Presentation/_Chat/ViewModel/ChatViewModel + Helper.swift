//
//  ChatViewModel + Helper.swift
//  ChatBot
//
//  Created by Gab on 2023/04/04.
//

import Foundation

// MARK: - ChatViewModelVCHelper
extension DefaultChatViewModel {
    
    func getChatListByDate() -> ChatListByDate {
        return self.chatList
    }
    
    func getChatDate() -> ChatDate {
        return self.sectionList
    }
}
