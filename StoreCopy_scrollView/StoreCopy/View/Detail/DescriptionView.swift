//
//  DescriptionTableViewCell.swift
//  StoreCopy
//
//  Created by JinBae Jeong on 2019/08/23.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class DescriptionView: UIView {
    
    lazy var data: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 0
        
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(data)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        NSLayoutConstraint.activate([
            data.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            data.leadingAnchor.constraint(equalTo: leadingAnchor),
            data.trailingAnchor.constraint(equalTo: trailingAnchor),
            data.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            data.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4)
        ])
    }

}
