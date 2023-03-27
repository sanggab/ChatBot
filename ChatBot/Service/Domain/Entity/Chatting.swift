//
//  Entity.swift
//  ChatGptBot
//
//  Created by yeoboya-211221-05 on 2023/03/23.
//

import Foundation

struct Chatting: Identifiable, Codable, Hashable {

    typealias ID = String
    
    var id: ID
    
    var object: String?
    
    var created: Int?
    
    var usage: Usage?
    
    var choices: [Choices]?
    
    enum CodingKeys: CodingKey {
        case id
        case object
        case created
        case usage
        case choices
    }
    
    internal init(id: Chatting.ID, object: String, created: Int, usage: Usage, choices: [Choices]) {
        self.id = id
        self.object = object
        self.created = created
        self.usage = usage
        self.choices = choices
    }
    
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<Chatting.CodingKeys> = try decoder.container(keyedBy: Chatting.CodingKeys.self)
        
        self.id = try container.decode(Chatting.ID.self, forKey: Chatting.CodingKeys.id)
        self.object = try container.decode(String.self, forKey: Chatting.CodingKeys.object)
        self.created = try container.decode(Int.self, forKey: Chatting.CodingKeys.created)
        self.usage = try container.decode(Usage.self, forKey: Chatting.CodingKeys.usage)
        self.choices = try container.decode([Choices].self, forKey: Chatting.CodingKeys.choices)
        
    }
    
}

struct Usage: Codable, Hashable {

    var prompt_tokens: Int
    
    var completion_tokens: Int
    
    var total_tokens: Int
    
    enum CodingKeys: CodingKey {
        case prompt_tokens
        case completion_tokens
        case total_tokens
    }
    
    internal init(prompt_tokens: Int, completion_tokens: Int, total_tokens: Int) {
        self.prompt_tokens = prompt_tokens
        self.completion_tokens = completion_tokens
        self.total_tokens = total_tokens
    }
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<Usage.CodingKeys> = try decoder.container(keyedBy: Usage.CodingKeys.self)
        
        self.prompt_tokens = try container.decode(Int.self, forKey: Usage.CodingKeys.prompt_tokens)
        self.completion_tokens = try container.decode(Int.self, forKey: Usage.CodingKeys.completion_tokens)
        self.total_tokens = try container.decode(Int.self, forKey: Usage.CodingKeys.total_tokens)
        
    }

}

struct Choices: Codable, Hashable {
    
    var message: Message
    
    var finish_reason: String
    
    var index: Int
    
    enum CodingKeys: CodingKey {
        case message
        case finish_reason
        case index
    }

    internal init(message: Message, finish_reason: String, index: Int) {
        self.message = message
        self.finish_reason = finish_reason
        self.index = index
    }
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<Choices.CodingKeys> = try decoder.container(keyedBy: Choices.CodingKeys.self)
        
        self.message = try container.decode(Message.self, forKey: Choices.CodingKeys.message)
        self.finish_reason = try container.decode(String.self, forKey: Choices.CodingKeys.finish_reason)
        self.index = try container.decode(Int.self, forKey: Choices.CodingKeys.index)
        
    }
    
}

struct Message: Codable, Hashable {

    var role: Role
    
    var content: String
    
    enum CodingKeys: CodingKey {
        case role
        case content
    }
    
    internal init(role: Role, content: String) {
        self.role = role
        self.content = content
    }
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<Message.CodingKeys> = try decoder.container(keyedBy: Message.CodingKeys.self)
        
        self.role = try container.decode(Role.self, forKey: Message.CodingKeys.role)
        self.content = try container.decode(String.self, forKey: Message.CodingKeys.content)
        
    }
    
}

enum Role: String, Codable {
    case system
    
    case user
    
    case assistant
}
