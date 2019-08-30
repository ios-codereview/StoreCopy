//
//  DescriptionTableViewCell.swift
//  StoreCopy
//
//  Created by JinBae Jeong on 2019/08/23.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit
import SnapKit

class DescriptionTableViewCell: UITableViewCell {
    
    lazy var data: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textAlignment = .center
        textView.font = UIFont.systemFont(ofSize: 18)
        
        return textView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(data)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        data.snp.makeConstraints{
            $0.edges.equalTo(contentView.snp.edges)
            $0.height.equalTo(UIScreen.main.bounds.height / 4)
        }
    }

}
