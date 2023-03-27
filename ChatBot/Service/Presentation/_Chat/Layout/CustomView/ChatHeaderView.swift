//
//  ChatHeaderView.swift
//  ChatGptBot
//
//  Created by Gab on 2023/03/24.
//

import UIKit
import PinLayout
import FlexLayout

class ChatHeaderView: UIView {
    
    let mainView: UIView = {
        let view = UIView()
            view.backgroundColor = .systemRed
        
        return view
    }()
    
    let backView: UIView = {
        let view = UIView()
            view.backgroundColor = .white
        
        return view
    }()
    
    let backImageView: UIImageView = {
        let imageView = UIImageView()
            imageView.image = .iconBack
        
        return imageView
    }()
    
    let moreView: UIView = {
        let view = UIView()
            view.backgroundColor = .white
        
        return view
    }()
    
    let moreImageView: UIImageView = {
        let imageView = UIImageView()
            imageView.image = .iconMore
        
        return imageView
    }()
    
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
        
        [
            backView
        ].forEach{ mainView.addSubview($0)}
        
        backView.addSubview(backImageView)
    }
    
    func setConstraints() {
        
        mainView.pin.all()
        
        backView.pin.centerLeft(8).size(44)
        
        backImageView.pin.all(8)
    }
    
    deinit {
        log.i("ChatHeaderView deinit")
    }
}
