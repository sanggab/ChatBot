//
//  ChatEntity.swift
//  ChatBot
//
//  Created by Gab on 2023/04/04.
//

import Foundation

struct ChatEntity: Identifiable, Codable, Hashable {
    
    typealias ID = String
    
    var id: String
    
    var date: Int?
    
    var message: Message
    
    internal init(id: String, date: Int?, message: Message) {
        self.id = id
        self.date = date
        self.message = message
    }
    
    enum CodingKeys: CodingKey {
        case id
        case date
        case message
    }
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<ChatEntity.CodingKeys> = try decoder.container(keyedBy: ChatEntity.CodingKeys.self)
        
        self.id = try container.decode(String.self, forKey: ChatEntity.CodingKeys.id)
        self.date = try container.decodeIfPresent(Int.self, forKey: ChatEntity.CodingKeys.date)
        self.message = try container.decode(Message.self, forKey: ChatEntity.CodingKeys.message)
        
    }
    
}
