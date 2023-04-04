//
//  StringExtension.swift
//  ChatBot
//
//  Created by Gab on 2023/04/04.
//

import Foundation

extension String {
    
    func makeLocalDate() throws -> String {
        
        guard let timeInterval = TimeInterval(self) else {
            throw Exception.message(msg: "TimeInterval Error")
        }
        
        let timeDate = Date(timeIntervalSince1970: timeInterval)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = .current
        dateFormatter.timeZone = .current
        
        return dateFormatter.string(from: timeDate)
    }
    
    func makeLocalTimeDate() -> String {
        
        let timeInterval = TimeInterval(self) ?? Date().timeIntervalSince1970
        
        let timeDate = Date(timeIntervalSince1970: timeInterval)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "a hh:mm"
        dateFormatter.locale = .current
        dateFormatter.timeZone = .current
        
        return dateFormatter.string(from: timeDate)
    }
}
