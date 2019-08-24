//
//  CategoryView.swift
//  StoreCopy
//
//  Created by JinBae Jeong on 2019/08/23.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    var categoryList: [String] = [] {
        didSet {
            print("@@@@ :", self.categoryList.count)
            for i in 0..<self.categoryList.count {
                let label = UILabel()
                label.layer.borderWidth = 1
                label.translatesAutoresizingMaskIntoConstraints = false
                label.text = "#\(categoryList[i])"
                self.categoryLabels.append(label)
            }
        }
    }
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        
        return label
    }()
    
    lazy var categoryLableView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        
        return view
    }()
    
    lazy var bottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        
        return view
    }()
    
    lazy var categoryLabels = [UILabel]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        configureConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        contentView.addSubview(topView)
        contentView.addSubview(title)
        contentView.addSubview(categoryLableView)
        contentView.addSubview(bottomView)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: contentView.topAnchor),
            topView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            topView.bottomAnchor.constraint(equalTo: title.topAnchor, constant: -20),
            topView.heightAnchor.constraint(equalToConstant: 20),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            title.bottomAnchor.constraint(equalTo: categoryLableView.topAnchor, constant: -50),
            
            categoryLableView.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            categoryLableView.trailingAnchor.constraint(equalTo: title.trailingAnchor),
            categoryLableView.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: -40),
            bottomView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 20),
        ])
        
        categoryLabels.forEach{
            categoryLableView.addSubview($0)
        }
        
        var lastLabel: UILabel?
        print("#### :", categoryLabels.count)
        for i in 0..<categoryLabels.count {
            let label = categoryLabels[i]
            label.textAlignment = .center
            label.widthAnchor.constraint(equalToConstant:
                label.intrinsicContentSize.width + 10).isActive = true
            label.heightAnchor.constraint(equalToConstant:
                label.intrinsicContentSize.height + 10).isActive = true
            if i == 0 {
                label.leadingAnchor.constraint(equalTo:
                    categoryLableView.leadingAnchor).isActive = true
                label.centerYAnchor.constraint(equalTo:
                    categoryLableView.centerYAnchor).isActive = true
            } else {
                if let last = lastLabel {
                    label.leadingAnchor.constraint(equalTo: last.trailingAnchor,
                                                   constant: 20).isActive = true
                    label.centerYAnchor.constraint(equalTo:
                        last.centerYAnchor).isActive = true
                }
            }
            lastLabel = label
        }
    }
}
