//
//  NormalTableViewCell.swift
//  StoreCopy
//
//  Created by JinBae Jeong on 2019/08/22.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit
import SnapKit

class NormalTableViewCell: UITableViewCell {
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        
        return label
    }()
    
    lazy var data: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = #colorLiteral(red: 0.2588235438, green: 0.6535076654, blue: 0.7991336601, alpha: 1)
        
        return label
    }()
    
    lazy var line: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        [title, data, line].forEach { contentView.addSubview($0) }
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        title.snp.makeConstraints{
            $0.top.equalTo(contentView.snp.top).offset(15)
            $0.left.equalTo(contentView.snp.left).offset(12)
            $0.bottom.equalTo(contentView.snp.bottom).offset(-15)
        }
        
        data.snp.makeConstraints{
            $0.centerY.equalTo(title.snp.centerY)
            $0.right.equalTo(contentView.snp.right).offset(-40)
        }
        
        line.snp.makeConstraints{
            $0.left.equalTo(title.snp.left)
            $0.right.equalTo(contentView.snp.right).offset(-12)
            $0.bottom.equalTo(contentView.snp.bottom)
            $0.height.equalTo(1)
        }
    }

}
