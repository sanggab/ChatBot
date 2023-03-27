//
//  ChatMainLayout.swift
//  ChatGptBot
//
//  Created by Gab on 2023/03/24.
//

import UIKit
import PinLayout
import FlexLayout

class ChatMainLayout: UIView {
    
    let layout: UIView = {
        let view = UIView()
            view.backgroundColor = .gray
        
        return view
    }()
    
    let mainView: UIView = {
        let view = UIView()
            view.backgroundColor = .systemBlue
        
        return view
    }()
    
    let headerView = ChatHeaderView(frame: .zero)
    
    let bodyView = ChatBodyView(frame: .zero)
    
    let inputBarView = ChatInputBarView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setLayout()
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
        
        self.addSubview(layout)
        
        layout.addSubview(mainView)
        
        [
            headerView,
            bodyView,
            inputBarView
        ].forEach{ mainView.addSubview($0)}
    }
    
    func setConstraints() {
        
        layout.pin.all()
        
        mainView.pin.all(layout.pin.safeArea)
        
        headerView.pin.left().top().right().height(60)
        
        inputBarView.pin.left().right().bottom().height(56)
        
        bodyView.pin.left().right().top(to: headerView.edge.bottom).bottom(to: inputBarView.edge.top)
    }
    
    deinit {
        log.i("ChatMainLayout deinit")
    }
}
