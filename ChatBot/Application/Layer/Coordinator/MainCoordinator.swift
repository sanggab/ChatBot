//
//  MainCoordinator.swift
//  ChatGptBot
//
//  Created by yeoboya-211221-05 on 2023/03/22.
//

import UIKit

protocol MainCoordinatorDependencies {
    
    func makeMainViewController(actions: MainActions) -> MainViewController
    
    func makeChatCoordinator(navigiaton: UINavigationController) -> ChatCoordinator
}

class MainCoordinator {
    
    weak var navigation: UINavigationController?
    private let dependencies: MainCoordinatorDependencies
    
    init(navigation: UINavigationController, dependencies: MainCoordinatorDependencies) {
        self.navigation = navigation
        self.dependencies = dependencies
    }
    
    func start() {
        
        let actions = MainActions(didOpenChat: didOpenChat, didShowAlert: didShowAlert)
        
        let vc = self.dependencies.makeMainViewController(actions: actions)
        
        self.navigation?.pushViewController(vc, animated: true)
    }
    
    deinit {
        log.i("MainCoordinator deinit")
    }
}

extension MainCoordinator {
    
    func didOpenChat(apiKey: String) {
        log.i(#function)
        log.i(apiKey)
        
        guard let navigation else {
            return
        }
        
        let coordinator = self.dependencies.makeChatCoordinator(navigiaton: navigation)
        
        DispatchQueue.main.async {
            coordinator.makeChat(apiKey: apiKey)
        }
    }
    
    func didShowAlert(alertModel: AlertModel) {
        
        DispatchQueue.main.async {
            self.navigation?.showAlert(alertModel: alertModel)
        }
    }
}
