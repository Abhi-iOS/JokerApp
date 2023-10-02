//
//  BaseTableViewController.swift
//  JokerApp
//
//  Created by Abhishek Singh on 02/10/23.
//

import UIKit

class BaseTableViewController: UITableViewController {
    // Use this class for base level setups.
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        // Override this method to setup TableView
        tableView.backgroundColor = AppColors.appBg.color
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.keyboardDismissMode = .onDrag
        tableView.separatorStyle = .none
    }
}
