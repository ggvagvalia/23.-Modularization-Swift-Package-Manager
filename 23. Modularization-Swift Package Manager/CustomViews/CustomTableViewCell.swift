//
//  CustomTableViewCell.swift
//  23. Modularization-Swift Package Manager
//
//  Created by gvantsa gvagvalia on 5/2/24.
//

import UIKit


class CustomTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    let containerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.cornerRadius = 25
        containerView.layer.masksToBounds = true
        containerView.layer.borderColor = UIColor.label.cgColor
        containerView.layer.borderWidth = 1.0
        containerView.backgroundColor = .tertiarySystemFill
        return containerView
    }()
    
    let catLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Error"
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .center
        label.textColor = .label
        return label
    }()
    
    // MARK: - LifeCycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setupUI
    func setupUI() {
        backgroundColor = .tertiarySystemBackground
        addSubview(containerView)
        containerView.addSubview(catLabel)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            
            catLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5),
            catLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5),
            catLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
        ])
    }
    //     MARK: - Configure
    func configure(with data: CatModel.Details?) {
        catLabel.text = data?.fact
    }
    
    // MARK: - UpdateBorderColor
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if #available(iOS 13.0, *) {
            containerView.layer.borderColor = UIColor.label.cgColor
        } else {
            containerView.layer.borderColor = UIColor.black.cgColor
        }
    }
    
}
