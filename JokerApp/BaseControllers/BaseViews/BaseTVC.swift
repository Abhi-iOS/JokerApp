//
//  BaseTVC.swift
//  JokerApp
//
//  Created by Abhishek Singh on 02/10/23.
//

import UIKit

class BaseTVC: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
