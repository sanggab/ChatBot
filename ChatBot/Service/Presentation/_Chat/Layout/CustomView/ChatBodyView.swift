//
//  ChatBodyView.swift
//  ChatGptBot
//
//  Created by Gab on 2023/03/27.
//

import UIKit
import PinLayout
import FlexLayout

class ChatBodyView: UIView {
    
    let mainView: UIView = {
        let view = UIView()
            view.backgroundColor = .white
        return view
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.showsVerticalScrollIndicator = false
        
        tableView.register(ChatDefaultCell.self, forCellReuseIdentifier: ChatDefaultCell.identifier)
            
        return tableView
    }()
    
    var dataSource: UITableViewDiffableDataSource<String, String>!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        log.i(#function)
        
        setConstraints()
    }
    
    func setLayout() {
        self.addSubview(mainView)
        
        mainView.addSubview(tableView)
    }
    
    func setConstraints() {
        
        mainView.pin.all()
        
        tableView.pin.all()
    }
    
    deinit {
        log.i("ChatBodyView deinit")
    }
}
