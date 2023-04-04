//
//  ChatAssistantCell.swift
//  ChatBot
//
//  Created by Gab on 2023/03/27.
//

import UIKit
import SnapKit
import Then
import PinLayout
import FlexLayout

class ChatAssistantCell: UITableViewCell {
    
    let mainView = UIView().then {
        $0.backgroundColor = .systemPink
    }
    
    let profileImageView = UIImageView().then {
        $0.image = .chatGPT
    }
    
    let nameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13)
        $0.textAlignment = .left
        $0.text = "ChatGPT"
        $0.textColor = .assistantName
        $0.sizeToFit()
    }

    let bodyView = UIView().then {
        $0.backgroundColor = .grayf1
    }
    
    let bodyLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13)
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.text = "Pretty good. What are you doing this weekend?"
        $0.textColor = .gray32
        $0.sizeToFit()
    }
    
    let timeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13)
        $0.textAlignment = .left
        $0.text = "오후 4:35"
        $0.textColor = .gray90
        $0.sizeToFit()
    }
    
    static let identifier = "ChatAssistantCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        self.backgroundColor = .gray
        
        setLayout()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func setLayout() {
        
        contentView.addSubview(mainView)
        
        
        [
            profileImageView,
            nameLabel,
            bodyView,
            timeLabel
        ].forEach{ mainView.addSubview($0)}

        bodyView.addSubview(bodyLabel)
    }
    
    func setConstraints() {
        
        mainView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        profileImageView.snp.makeConstraints {
            $0.left.equalToSuperview().inset(12)
            $0.top.equalToSuperview()
            $0.size.equalTo(44)
        }

        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(2)
            $0.left.equalTo(profileImageView.snp.right).offset(8)
        }
        
        bodyView.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(4)
            $0.left.equalTo(profileImageView.snp.right).offset(8)
            $0.bottom.equalToSuperview().inset(16)
            $0.width.lessThanOrEqualTo(239)
        }
        
        bodyLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(8)
            $0.left.equalToSuperview().inset(16)
            $0.right.equalToSuperview().inset(24)
        }
        
        timeLabel.snp.makeConstraints {
            $0.left.equalTo(bodyView.snp.right).offset(6)
            $0.bottom.equalTo(bodyView.snp.bottom)
        }
        
    }
    
    func configUI(chatEntity: ChatEntity) {
        self.bodyLabel.text = chatEntity.message.content
        self.timeLabel.text = chatEntity.date?.toString().makeLocalTimeDate()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.bodyLabel.text = nil
        self.timeLabel.text = nil
    }

}

