//
//  MainHeaderView.swift
//  ChatGptBot
//
//  Created by yeoboya-211221-05 on 2023/03/22.
//

import UIKit
import PinLayout
import FlexLayout

class MainHeaderView: UIView {
    
    let mainView: UIView = {
        let view = UIView()
            view.backgroundColor = .systemOrange
        
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
            label.text = "메인"
            label.textColor = .black
            label.font = .boldSystemFont(ofSize: 14)
            label.textAlignment = .center
            label.sizeToFit()
        
        return label
    }()
    
    let actionContarinerView: UIView = {
        let view = UIView()
            view.backgroundColor = .red
        
        return view
    }()
    
    let menuView: UIView = {
        let view = UIView()
            view.backgroundColor = .white
        
            view.layer.cornerRadius = 4
            view.layer.borderWidth = 1
            view.layer.borderColor = UIColor.gray32.cgColor
        
            view.isUserInteractionEnabled = true
        
        return view
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
            imageView.contentMode = .scaleToFill
            imageView.image = .iconMypage
            imageView.backgroundColor = .blue
        
            imageView.isUserInteractionEnabled = true
        
        return imageView
    }()
    
    let menuTitleLable: UILabel = {
        let label = UILabel()
            label.text = "메뉴"
            label.textColor = .black
            label.font = .boldSystemFont(ofSize: 12)
            label.textAlignment = .center
            label.sizeToFit()
        
        return label
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
            titleLabel,
            actionContarinerView
        ].forEach{ mainView.addSubview($0)}
        
        actionContarinerView.flex.direction(.row).define { flex in

            flex.addItem(menuView).width(55)

            flex.addItem(profileImageView).width(44).marginLeft(12)
        }

        menuView.addSubview(menuTitleLable)
    }
    
    func setConstraints() {
        
        mainView.pin.all()
        
        titleLabel.pin.center()
        
        menuTitleLable.pin.center()
        
        actionContarinerView.pin.centerRight(12).height(44)
        
        actionContarinerView.flex.layout(mode: .adjustWidth)
        
    }
    
}
