//
//  Log.swift
//  ChatGptBot
//
//  Created by Gab on 2023/03/24.
//

import Foundation


public final class log {
    
    enum Event: String {
        case i = "📘" // info
        case d = "📔" // debug
        case e = "‼️" // error
    }
    
    class func i(_ items: Any, _ fileID: String = #fileID, _ function: String = #function, _ line: Int = #line, _ event: Event = .i) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let date = dateFormatter.string(from: Date())
        
        let splitFileID = fileID.components(separatedBy: "/").last?.components(separatedBy: ".").first ?? fileID
        
        let log = date + " INFO \(event.rawValue) " + splitFileID + "." + function + ":\(line)" + " -> " + String(describing: items)
        
        let logList = """
        \(log)
        """

        print(logList)
    }
    
    class func d(_ items: Any, _ fileID: String = #fileID, _ function: String = #function, _ line: Int = #line, _ event: Event = .d) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let date = dateFormatter.string(from: Date())
        
        let splitFileID = fileID.components(separatedBy: "/").last?.components(separatedBy: ".").first ?? fileID
        
        let log = date + " DEBUG \(event.rawValue) " + splitFileID + "." + function + ":\(line)" + " - " + String(describing: items)
        
        let logList = """
        \(log)
        """

        print(logList)
    }
    
    class func e(_ items: Any, _ fileID: String = #fileID, _ function: String = #function, _ line: Int = #line, _ event: Event = .e) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let date = dateFormatter.string(from: Date())
        
        let splitFileID = fileID.components(separatedBy: "/").last?.components(separatedBy: ".").first ?? fileID
        
        let log = date + " DEBUG \(event.rawValue) " + splitFileID + "." + function + ":\(line)" + " - " + String(describing: items)
        
        let logList = """
        \(log)
        """

        print(logList)
    }

}
