//
//  ChatUserCell.swift
//  ChatGptBot
//
//  Created by Gab on 2023/03/27.
//

import UIKit
import Then
import SnapKit
import PinLayout
import FlexLayout

class ChatUserCell: UITableViewCell {
    
    static let identifier = "ChatUserCell"
    
    let mainView = UIView().then {
        $0.backgroundColor = .systemBlue
    }
    
    let bodyView = UIView().then {
        $0.backgroundColor = .primary450
    }
    
    let bodyLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13)
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.text = "Nothing... I would like ti go ti watch a movie.."
        $0.textColor = .gray32
        $0.sizeToFit()
    }
    
    let timeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13)
        $0.textAlignment = .right
        $0.numberOfLines = 0
        $0.text = "오후 03:27"
        $0.textColor = .gray90
        $0.sizeToFit()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
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
            bodyView,
            timeLabel
        ].forEach{ mainView.addSubview($0)}
        
        bodyView.addSubview(bodyLabel)
    }
    
    func setConstraints() {
        
        mainView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        bodyView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.right.equalToSuperview().inset(12)
            $0.width.lessThanOrEqualTo(290)
            $0.bottom.equalToSuperview().inset(16)
        }
        
        bodyLabel.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview().inset(8)
            $0.left.equalToSuperview().inset(16)
            $0.right.equalToSuperview().inset(24)
        }
        
        timeLabel.snp.makeConstraints {
            $0.bottom.equalTo(bodyView.snp.bottom)
            $0.right.equalTo(bodyView.snp.left).offset(-6)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
