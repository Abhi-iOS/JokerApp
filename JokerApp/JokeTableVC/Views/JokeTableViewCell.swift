//
//  JokeTableViewCell.swift
//  JokerApp
//
//  Created by Abhishek Singh on 02/10/23.
//

import UIKit

final class JokeTableViewCell: BaseTVC {
    
    private struct Constants {
        static let sideCurves: CGFloat = 8
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = AppColors.textGrey.color
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Date().formatted(date: .abbreviated, time: .standard)
        return label
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = AppColors.cellBg.color
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        containerView.layer.cornerRadius = Constants.sideCurves
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
    }
}

//MARK: - Create Cell Views
private extension JokeTableViewCell {
    func createViews() {
        contentView.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
        ])
        
        containerView.addSubviews(titleLabel, timeLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
        ])
        
        NSLayoutConstraint.activate([
            timeLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 0),
            timeLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 0),
            timeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
            timeLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
        ])
    }
}

//MARK: - Setup Cell Data
extension JokeTableViewCell {
    func setData(_ joke: String) {
        titleLabel.text = joke
    }
}
