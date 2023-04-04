//
//  ChatDIContainer.swift
//  ChatGptBot
//
//  Created by yeoboya-211221-05 on 2023/03/24.
//

import UIKit


class ChatDIContainer {
    
    func makeChatCoordinator(navigation: UINavigationController) -> ChatCoordinator {
        return ChatCoordinator(navigation: navigation, dependencies: self)
    }
}

extension ChatDIContainer: ChatCoordinatorDependencies {
    
    func makeChatViewController(actions: ChatActions) -> ChatViewController {
        let viewModel = DefaultChatViewModel(actions: actions,
                                             chatUseCase: makeChatUseCase(),
                                             resourceUseCase: makeResourceUseCase())
        
        return ChatViewController.create(viewModel: viewModel)
    }
    
    func makeChatUseCase() -> FetchChatUseCase {
        return DefaultChatUseCase(repository: makeChatRepository())
    }
    
    func makeChatRepository() -> ChatRepository {
        return DefaultChatRepository()
    }
    
    func makeResourceUseCase() -> FetchResourceUseCase {
        return DefaultResourceUseCase(repository: makeResourceRepository())
    }
    
    func makeResourceRepository() -> ResourceRepository {
        return DefaultResourceRepository()
    }
}
