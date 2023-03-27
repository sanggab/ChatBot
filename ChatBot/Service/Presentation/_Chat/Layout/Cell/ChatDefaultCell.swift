//
//  ChatDefaultCell.swift
//  ChatGptBot
//
//  Created by Gab on 2023/03/27.
//

import UIKit
import PinLayout
import FlexLayout

class ChatDefaultCell: UITableViewCell {
    
    static let identifier = "ChatDefaultCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
