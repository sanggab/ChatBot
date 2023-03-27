//
//  MainDIContainer.swift
//  ChatGptBot
//
//  Created by yeoboya-211221-05 on 2023/03/22.
//

import UIKit


class MainDIContainer {
    func makeMainCoordinator(navigation: UINavigationController) -> MainCoordinator {
        MainCoordinator(navigation: navigation, dependencies: self)
    }
}

extension MainDIContainer: MainCoordinatorDependencies {
    
    func makeMainViewController(actions: MainActions) -> MainViewController {
        
        let viewModel = DefaultMainViewModel(actions: actions, mainUseCase: makeMainUseCase())
        
        return MainViewController.create(with: viewModel)
    }
    
    func makeMainUseCase() -> FetchMainUseCase {
        
        return DefaultMainUseCase(repository: makeMainRepository())
    }
    
    func makeMainRepository() -> MainRepository {
        return DefaultMainRepository()
    }
}

extension MainDIContainer {
    
    func makeChatCoordinator(navigiaton: UINavigationController) -> ChatCoordinator {
        let di = ChatDIContainer()
        
        return di.makeChatCoordinator(navigation: navigiaton)
    }
}
