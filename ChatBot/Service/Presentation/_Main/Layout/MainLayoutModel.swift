//
//  MainLayoutModel.swift
//  ChatGptBot
//
//  Created by yeoboya-211221-05 on 2023/03/22.
//

import UIKit
import PinLayout
import FlexLayout

protocol MainLayoutModelDelegate: AnyObject {
    func actions(name: String)
}

class MainLayoutModel {
    
    let layout: UIView = {
        let view = UIView()
            view.backgroundColor = .clear
        
        return view
    }()
    
    let mainView: UIView = {
        let view = UIView()
            view.backgroundColor = .systemBlue
        
        return view
    }()
    
    let menuDimView: UIView = {
        let view = UIView()
            view.backgroundColor = UIColor(redF: 0, greenF: 0, blueF: 0, alpha: 0.4)
            view.isHidden = true
        
        return view
    }()
    
    let menuListView: UIView = {
        let view = UIView()
            view.backgroundColor = .white
            view.clipsToBounds = true
            view.layer.cornerRadius = 12
        
        return view
    }()
    
    let chatbotView: UIView = {
        let view = UIView()
            view.backgroundColor = .white
        
        return view
    }()
    
    let chatbotImageView: UIImageView = {
        let imageView = UIImageView()
            imageView.contentMode = .scaleToFill
            imageView.image = .iconMenuMessage
        
        return imageView
    }()
    
    let chatbotLabel: UILabel = {
        let label = UILabel()
        label.text = "ChatBoT"
        label.textColor = .gray32
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13)
        
        return label
    }()
    
    let mypageView: UIView = {
        let view = UIView()
            view.backgroundColor = .white
        
        return view
    }()
    
    let mypageImageView: UIImageView = {
        let imageView = UIImageView()
            imageView.contentMode = .scaleToFill
            imageView.image = .iconMenuMypage
        
        return imageView
    }()
    
    let mypageLabel: UILabel = {
        let label = UILabel()
        label.text = "My page"
        label.textColor = .gray32
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13)
        
        return label
    }()
    
    let headerView = MainHeaderView(frame: .zero)
    
    weak var delegate: MainLayoutModelDelegate?
    
    func loadView(superView: UIView) {
        
        superView.addSubview(layout)
        
        setLayout()
        bind()
    }
    
    func setLayout() {
        
        layout.addSubview(mainView)
        
        [
            headerView,
            menuDimView
        ].forEach{ mainView.addSubview($0)}
        
        menuDimView.addSubview(menuListView)
        
        menuListView.flex.direction(.column).define { flex in

            flex.addItem(chatbotView).height(64).alignItems(.center).define { flex in
                
                flex.addItem(chatbotImageView).marginTop(8).size(28)
                
                flex.addItem(chatbotLabel).marginTop(1).marginBottom(8)
                
            }

            flex.addItem().height(1).backgroundColor(.graye1)

            flex.addItem(mypageView).height(64).alignItems(.center).define { flex in
                
                flex.addItem(mypageImageView).marginTop(8).size(28)
                
                flex.addItem(mypageLabel).marginTop(1).marginBottom(8)
            }
        }
    }
    
    func setConstraints() {
        
        layout.pin.all()
   
        mainView.pin.all(layout.pin.safeArea)
        
        headerView.pin.left().top().right().height(50)
        
        menuDimView.pin.all()
        
    }
    
    func bind() {
        
        headerViewBind()
        menuDimViewBind()
        menuListViewBind()
    }
    
    func headerViewBind() {
        let menuTap = UITapGestureRecognizer(target: self, action: #selector(didTapMenuView))
        
        let profileTap = UITapGestureRecognizer(target: self, action: #selector(didTapProfileView))
            profileTap.name = "profile"
        
        headerView.menuView.addGestureRecognizer(menuTap)
        headerView.profileImageView.addGestureRecognizer(profileTap)
        
    }
    
    func menuDimViewBind() {
        let menuTap = UITapGestureRecognizer(target: self, action: #selector(didTapMenuDimView))
        
        menuDimView.addGestureRecognizer(menuTap)
    }
    
    func menuListViewBind() {
        let chatbotTap = UITapGestureRecognizer(target: self, action: #selector(didTapChatBotView))
            chatbotTap.name = "chatbot"
        
        let mypageTap = UITapGestureRecognizer(target: self, action: #selector(didTapProfileView))
            mypageTap.name = "profile"
        
        chatbotView.addGestureRecognizer(chatbotTap)
        mypageView.addGestureRecognizer(mypageTap)
    }
    
    deinit {
        log.i("MainLayoutModel deinit")
    }
}
