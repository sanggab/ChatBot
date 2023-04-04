//
//  FetchKeyModel.swift
//  ChatGptBot
//
//  Created by yeoboya-211221-05 on 2023/03/24.
//

import Foundation

struct FetchKeyModel: Decodable, Equatable {
    
    var retconts: String
    
    var retmsg: String

    enum CodingKeys: CodingKey {
        case retconts
        case retmsg
    }
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<FetchKeyModel.CodingKeys> = try decoder.container(keyedBy: FetchKeyModel.CodingKeys.self)
        
        self.retconts = try container.decode(String.self, forKey: FetchKeyModel.CodingKeys.retconts)
        self.retmsg = try container.decode(String.self, forKey: FetchKeyModel.CodingKeys.retmsg)
        
    }
}
