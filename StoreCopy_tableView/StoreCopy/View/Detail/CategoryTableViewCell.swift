//
//  CategoryView.swift
//  StoreCopy
//
//  Created by JinBae Jeong on 2019/08/23.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit
import SnapKit

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
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        
        return label
    }()
    
    lazy var categoryLableView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    lazy var topView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        
        return view
    }()
    
    lazy var bottomView: UIView = {
        let view = UIView()
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
        [topView, title, categoryLableView, bottomView].forEach { contentView.addSubview($0) }
    }
    
    private func configureConstraints() {
        topView.snp.makeConstraints{
            $0.top.equalTo(contentView.snp.top)
            $0.left.equalTo(contentView.snp.left)
            $0.right.equalTo(contentView.snp.right)
            $0.bottom.equalTo(title.snp.top).offset(-20)
            $0.height.equalTo(20)
        }
        
        title.snp.makeConstraints{
            $0.left.equalTo(contentView.snp.left).offset(12)
            $0.right.equalTo(contentView.snp.right).offset(-12)
            $0.bottom.equalTo(categoryLableView.snp.top).offset(-50)
        }
        
        categoryLableView.snp.makeConstraints{
            $0.left.equalTo(title.snp.left)
            $0.right.equalTo(title.snp.right)
            $0.bottom.equalTo(bottomView.snp.top).offset(-40)
        }
        
        bottomView.snp.makeConstraints{
            $0.left.equalTo(contentView.snp.left)
            $0.right.equalTo(contentView.snp.right)
            $0.bottom.equalTo(contentView.snp.bottom)
            $0.height.equalTo(20)
        }
        
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
