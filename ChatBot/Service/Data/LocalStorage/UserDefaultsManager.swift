//
//  UserDefaultsManager.swift
//  ChatBot
//
//  Created by Gab on 2023/04/04.
//

import Foundation

final class UserDefaultsManager {

    
    static var CHATTING_LIST: Data? {
        get {
            UserDefaults.standard.object(forKey: "CHTTING_LIST") as? Data
        } set {
            UserDefaults.standard.set(newValue, forKey: "CHTTING_LIST")
        }
    }

    static var REMAIN_TEXT: Data? {
        get {
            UserDefaults.standard.object(forKey: "REMAIN_TEXT") as? Data
        } set {
            UserDefaults.standard.set(newValue, forKey: "REMAIN_TEXT")
        }
    }
    
    
}
