//
//  MainViewController.swift
//  ChatGptBot
//
//  Created by yeoboya-211221-05 on 2023/03/22.
//

import UIKit

class MainViewController: UIViewController {
    
    var viewModel: MainViewModel!
    var layoutModel: MainLayoutModel!
    
    let headerView = MainHeaderView(frame: .zero)
    
    class func create(with viewModel: MainViewModel) -> MainViewController {
        
        let vc = MainViewController()
        vc.viewModel = viewModel
        
        let layout = MainLayoutModel()
        vc.layoutModel = layout
        
        return vc
        
    }
    
    override func loadView() {
        self.view = .init()
        view.backgroundColor = .white
        
        layoutModel.loadView(superView: self.view)
        
        setDelegate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        log.i(#function)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        log.i(#function)
        
        layoutModel.setConstraints()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }

    func setDelegate() {
        layoutModel.delegate = self
    }
    
    deinit {
        log.i("MainViewController deinit")
    }
}

extension MainViewController: MainLayoutModelDelegate {
    
    func actions(name: String) {
        log.i("\(#function) -> \(name)")
        switch name {
        case "chatbot":
            viewModel.openChatBot()
        case "profile":
            viewModel.openProfile()
        default:
            break
        }
    }
}
