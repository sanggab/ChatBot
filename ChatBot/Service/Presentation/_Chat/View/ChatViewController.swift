//
//  ChatViewController.swift
//  ChatGptBot
//
//  Created by yeoboya-211221-05 on 2023/03/24.
//

import UIKit
import Combine

class ChatViewController: UIViewController {
    
    var viewModel: ChatViewModel!
    var layoutModel: ChatLayoutModel!
    
    class func create(viewModel: ChatViewModel) -> ChatViewController {
        let vc = ChatViewController()
            vc.viewModel = viewModel
        
        let layout = ChatLayoutModel()
            vc.layoutModel = layout
        
        return vc
    }
    
    override func loadView() {
        log.i(#function)
        self.view = layoutModel.layout
        
        layoutModel.loadView()
        
        setDataSource()
        
        viewModel.loadView()
        
        setDelegate()
        
        bind()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        log.i(#function)
        
        reloadData()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        log.i(#function)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        log.i(#function)
    }
    
    func setDelegate() {
        self.layoutModel.delegate = self
        self.layoutModel.layout.bodyView.tableView.delegate = self
    }
    
    func setDataSource() {
        
        layoutModel.layout.bodyView.dataSource = UITableViewDiffableDataSource<String, ChatEntity>(tableView: layoutModel.layout.bodyView.tableView, cellProvider: { [weak self] (tableView, indexPath, chatting) in
            
            guard let `self` = self else { return UITableViewCell() }
            
            switch chatting.message.role {
            case .user:

                let cell = tableView.dequeueReusableCell(withIdentifier: ChatUserCell.identifier, for: indexPath) as? ChatUserCell
                
                cell?.configUI(chatEntity: chatting)

                return cell

            case .assistant:

                let cell = tableView.dequeueReusableCell(withIdentifier: ChatAssistantCell.identifier, for: indexPath) as? ChatAssistantCell
                
                cell?.configUI(chatEntity: chatting)

                return cell

            default:
                return UITableViewCell()
            }
            
        })
        
        layoutModel.layout.bodyView.tableView.dataSource = layoutModel.layout.bodyView.dataSource
    }
    
    @MainActor
    func reloadData() {
        
        var snapShot = NSDiffableDataSourceSnapshot<String, ChatEntity>()
        
        let section = self.viewModel.getChatDate()
        
        let chatList = self.viewModel.getChatListByDate()
        
        snapShot.appendSections(section)
        
        section.forEach {
            snapShot.appendItems(chatList[$0] ?? [], toSection: $0)
        }
        
        layoutModel.layout.bodyView.dataSource.apply(snapShot, animatingDifferences: false)
    }
    
    func bind() {
        essesntailBind(to: viewModel)
    }
    
    func essesntailBind(to viewModel: ChatViewModel) {
        
        self.viewModel._didListLoad.subscribe(onNext: { [weak self] (state) in
            guard let `self` = self else { return }
            log.i("didListLoad")
            self.reloadData()
        })
    }
    
    deinit {
        log.i("ChatViewController deinit")
    }
}

extension ChatViewController: ChatLayoutModelProtocol {
    
    func didTapBackView() {
        self.viewModel.closeChatBot()
    }
    
    func didTapSendMessage(text: String) {
        self.viewModel.sendMessage(text: text)
    }
}
