//
//  CodableExtension.swift
//  ChatGptBot
//
//  Created by Gab on 2023/03/27.
//

import Foundation


extension Encodable {
    /// Sweeter: Export object to a dictionary representation
    var toDictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}
