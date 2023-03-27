//
//  MainViewModel + Response.swift
//  ChatGptBot
//
//  Created by yeoboya-211221-05 on 2023/03/24.
//

import Foundation

extension DefaultMainViewModel {
    
    func responseCheck(response: Any) throws -> String {
        
        guard let response = response as? [String : Any] else {
            throw Exception.GuardBinding.casting(data: response)
        }
        
        log.i("response -> \(response)")
        
        guard let retmsg = response["retmsg"] as? String,
              let retconts = response["retconts"] as? String else {
            throw Exception.GuardBinding.casting(data: "retmsg or retconts")
        }
        
        guard retmsg == "00000" else {
            throw Exception.message(msg: retconts)
        }
        
        return retconts
    }
}
