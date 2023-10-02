//
//  JokeTableViewController.swift
//  JokerApp
//
//  Created by Abhishek Singh on 02/10/23.
//

import UIKit

final class JokeTableViewController: BaseTableViewController {
    
    private let viewModel: JokeViewModel
    
    init(with vm: JokeViewModel) {
        self.viewModel = vm
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupViews() {
        super.setupViews()
        setTitle("UnLimit Jokes")
        tableView.register(JokeTableViewCell.self, forCellReuseIdentifier: JokeTableViewCell.description())
        viewModel.getJoke(with: self)
    }
    
    func setTitle(_ title: String) {
        navigationItem.title = title
    }
}

extension JokeTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.jokesDataSource.jokes.endIndex
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: JokeTableViewCell.description(), for: indexPath)
        if let cell = cell as? JokeTableViewCell {
            cell.setData(viewModel.jokesDataSource.jokes[indexPath.row])
        }
        return cell
    }
}

//MARK: - JokeRefresherDelegate
extension JokeTableViewController: JokeRefresherDelegate {
    func refreshDataSource() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadSections(IndexSet(integer: 0), with: .none)
        }
    }
}
