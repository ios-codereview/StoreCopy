//
//  FeatureTableViewCell.swift
//  StoreCopy
//
//  Created by JinBae Jeong on 2019/08/22.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit
import SnapKit

class FeatureTableViewCell: UITableViewCell {
    
    lazy var topView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = "1111"
        
        return label
    }()
    
    lazy var data: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = #colorLiteral(red: 0.2588235438, green: 0.6535076654, blue: 0.7991336601, alpha: 1)
        
        return label
    }()
    
    lazy var expandArrow: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "arrow")
        
        return imageView
    }()
    
    lazy var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.95, green: 0.95,
                                           blue: 0.95, alpha: 1)
        
        return view
    }()
    
    lazy var bottomViewText: UITextView = {
        let textView = UITextView()
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
        [topView, bottomView].forEach { contentView.addSubview($0) }
        [title, data, expandArrow].forEach { topView.addSubview($0) }
        bottomView.addSubview(bottomViewText)
        
        configureConstraints()
    }
    
    var popHiddenPriority: NSLayoutConstraint?
    var popShowPriority: NSLayoutConstraint?
    
    private func configureConstraints() {
        topView.snp.makeConstraints{
            $0.top.equalTo(contentView.snp.top)
            $0.left.equalTo(contentView.snp.left).offset(12)
            $0.right.equalTo(contentView.snp.right).offset(-12)
            $0.bottom.equalTo(bottomView.snp.top)
            $0.height.equalTo(60)
        }
        
        title.snp.makeConstraints{
            $0.top.equalTo(topView.snp.top).offset(15)
            $0.left.equalTo(topView.snp.left)
            $0.bottom.equalTo(topView.snp.bottom).offset(-15)
        }
        
        data.snp.makeConstraints{
            $0.centerY.equalTo(title.snp.centerY)
            $0.right.equalTo(expandArrow.snp.left)
        }
        
        expandArrow.snp.makeConstraints{
            $0.centerY.equalTo(title.snp.centerY)
            $0.right.equalTo(contentView.snp.right).offset(-10)
        }
        
        bottomView.snp.makeConstraints{
            $0.left.equalTo(topView.snp.left)
            $0.right.equalTo(topView.snp.right)
            $0.bottom.equalTo(contentView.snp.bottom)
        }
        
        bottomViewText.snp.makeConstraints{
            $0.top.equalTo(bottomView.snp.top).offset(12)
            $0.left.equalTo(bottomView.snp.left).offset(12)
            $0.right.equalTo(bottomView.snp.right).offset(-12)
            $0.bottom.equalTo(bottomView.snp.bottom).offset(-12)
        }
    }
    

}
