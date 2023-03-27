//
//  ChatCoordinator.swift
//  ChatGptBot
//
//  Created by yeoboya-211221-05 on 2023/03/24.
//

import UIKit

protocol ChatCoordinatorDependencies {
    
    func makeChatViewController(actions: ChatActions) -> ChatViewController
}

class ChatCoordinator {
    
    weak var navigation: UINavigationController?
    private let dependencies: ChatCoordinatorDependencies
    
    init(navigation: UINavigationController, dependencies: ChatCoordinatorDependencies) {
        self.navigation = navigation
        self.dependencies = dependencies
    }
    
    func makeChat(apiKey: String) {
        
        let actions = ChatActions(didCloseTap: didTapClose)
        
        let vc = self.dependencies.makeChatViewController(actions: actions)
        
        self.navigation?.pushViewController(vc, animated: true)
    }
    
    deinit {
        log.i("ChatCoordinator deinit")
    }
}

// MARK: - Chat Actions
extension ChatCoordinator {
    
    func didTapClose() {
        self.navigation?.popViewController(animated: true)
    }
}
