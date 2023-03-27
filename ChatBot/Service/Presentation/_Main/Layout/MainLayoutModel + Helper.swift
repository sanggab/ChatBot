//
//  MainLayoutModel + Helper.swift
//  ChatGptBot
//
//  Created by yeoboya-211221-05 on 2023/03/23.
//

import UIKit
import PinLayout
import FlexLayout

// MARK: - Helper
extension MainLayoutModel {
    
    func openMenuListView(_ state: Bool) {
        
        switch state {
        case true:
            menuDimView.isHidden = state
            
        case false:
            menuListView.pin.width(96).topCenter(to: headerView.menuView.anchor.bottomCenter).marginTop(10)
            menuListView.flex.layout(mode: .adjustHeight)
            menuDimView.isHidden = state
        }
        
    }
}
