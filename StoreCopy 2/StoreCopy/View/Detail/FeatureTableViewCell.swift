//
//  FeatureTableViewCell.swift
//  StoreCopy
//
//  Created by JinBae Jeong on 2019/08/22.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class FeatureTableViewCell: UITableViewCell {
    
    lazy var topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = "1111"
        
        return label
    }()
    
    lazy var data: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = #colorLiteral(red: 0.2588235438, green: 0.6535076654, blue: 0.7991336601, alpha: 1)
        
        return label
    }()
    
    lazy var expandArrow: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "arrow")
        
        return imageView
    }()
    
    lazy var bottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.95, green: 0.95,
                                           blue: 0.95, alpha: 1)
        
        return view
    }()
    
    lazy var bottomViewText: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.backgroundColor = UIColor(red: 0.95, green: 0.95,
                                       blue: 0.95, alpha: 1)
        textView.isHidden = true
        
        return textView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        contentView.addSubview(topView)
        topView.addSubview(title)
        topView.addSubview(data)
        topView.addSubview(expandArrow)
        contentView.addSubview(bottomView)
        bottomView.addSubview(bottomViewText)
        
        configureConstraints()
    }
    
    var popHiddenPriority: NSLayoutConstraint?
    var popShowPriority: NSLayoutConstraint?
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: contentView.topAnchor),
            topView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            topView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            topView.bottomAnchor.constraint(equalTo: bottomView.topAnchor),
            topView.heightAnchor.constraint(equalToConstant: 60),
            title.topAnchor.constraint(equalTo: topView.topAnchor, constant: 15),
            title.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            title.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -15),
            data.centerYAnchor.constraint(equalTo: title.centerYAnchor),
            data.trailingAnchor.constraint(equalTo: expandArrow.leadingAnchor),
            expandArrow.centerYAnchor.constraint(equalTo: title.centerYAnchor),
            expandArrow.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            bottomView.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: topView.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            bottomViewText.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 12),
            bottomViewText.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 12),
            bottomViewText.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -12),
            bottomViewText.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -12),
        ])
    }
    

}
