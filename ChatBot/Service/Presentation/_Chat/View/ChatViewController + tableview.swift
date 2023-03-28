//
//  ChatViewController + tableview.swift
//  ChatBot
//
//  Created by Gab on 2023/03/27.
//

import UIKit

extension ChatViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
