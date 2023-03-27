//
//  MainViewModel.swift
//  ChatGptBot
//
//  Created by yeoboya-211221-05 on 2023/03/22.
//

import Foundation

struct MainActions {
    
    var didOpenChat: ((String) -> Void)?
    var didShowAlert: ((AlertModel) -> Void)?
}

protocol MainViewModelInput {
    
    func openChatBot()
    func openProfile()
}

protocol MainViewModelOutput {
    
}

protocol MainViewModel: MainViewModelInput, MainViewModelOutput {
    
}

final class DefaultMainViewModel: MainViewModel {
    
    var actions: MainActions
    var mainUseCase: FetchMainUseCase
    
    init(actions: MainActions, mainUseCase: FetchMainUseCase) {
        self.actions = actions
        self.mainUseCase = mainUseCase
    }
}

// MARK: - Layout Tap Input
extension DefaultMainViewModel {
    
    func openChatBot() {
        log.i(#function)
        
        self.actions.didOpenChat?("")
//        self.getAPIKey(completion: { [weak self] (apikey) in
//
//            guard let `self` = self else { return }
//
//            self.actions.didOpenChat?(apikey)
//
//        })
        
    }
    
    func openProfile() {
        log.i(#function)
    }
}

// MARK: - Common API
extension DefaultMainViewModel {
    
    func getAPIKey(completion: @escaping ((String) -> Void)) {
        
        mainUseCase.getAPIKey(param: makeGetAPIKeyModel(), completion: { [weak self] (result) in

            guard let `self` = self else { return }

            do {

                switch result {
                case .success(let response):

                    let apikey = try self.responseCheck(response: response)

                    completion(apikey)
                    
                case .failure(let error):
                    throw error
                }

            } catch {
                self.errorControl(error: error)
            }

        })
    }
}

// MARK: - Helper
extension DefaultMainViewModel {
    
    func makeGetAPIKeyModel() -> [String : Any] {
        
        let param: [String : Any] = [
            :
        ]
        
        return param
    }
    
    func showAlert(title: String, message: String) {
        
        let alertModel = AlertModel(title: title, message: message, alertStyle: .alert)
        self.actions.didShowAlert?(alertModel)
    }
    
}

// MARK: - Error Control
extension DefaultMainViewModel {
    
    func errorControl(error: Error) {
        
        log.i(#function)
        log.e(error.localizedDescription)
        
        switch error {
        case Exception.message(let msg):
            self.showAlert(title: "알림", message: msg)
            
        case Exception.NetWork.result(let statusCode, let msg):
            self.showAlert(title: statusCode, message: msg)
            
        case Exception.GuardBinding.none:
            log.i("GuardBinding")
        default:
            break
        }
    }
}
