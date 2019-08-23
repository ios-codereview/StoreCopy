//
//  NormalTableViewCell.swift
//  StoreCopy
//
//  Created by JinBae Jeong on 2019/08/22.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class NormalTableViewCell: UITableViewCell {
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        
        return label
    }()
    
    lazy var data: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = #colorLiteral(red: 0.2588235438, green: 0.6535076654, blue: 0.7991336601, alpha: 1)
        
        return label
    }()
    
    lazy var line: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(title)
        contentView.addSubview(data)
        contentView.addSubview(line)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            data.centerYAnchor.constraint(equalTo: title.centerYAnchor),
            data.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            line.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            line.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            line.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            line.heightAnchor.constraint(equalToConstant: 1),
        ])
    }

}
