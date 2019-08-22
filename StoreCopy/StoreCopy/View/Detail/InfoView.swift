//
//  InfoView.swift
//  StoreCopy
//
//  Created by JinBae Jeong on 2019/08/22.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class InfoView: UIView {

    lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1111"
        
        return label
    }()
    
    lazy var seller: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1111"
        
        return label
    }()
    
    lazy var price: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1111"
        
        return label
    }()
    
    lazy var buttonWrap: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        print(1111)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(title)
        
        configureConstraints()
    }

    private func configureConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 6),
            title.bottomAnchor.constraint(equalTo: seller.topAnchor, constant: -6),
            seller.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            seller.bottomAnchor.constraint(equalTo: price.topAnchor, constant: -6),
            price.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            price.bottomAnchor.constraint(equalTo: buttonWrap.topAnchor, constant: -6),
            buttonWrap.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            buttonWrap.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -6),
            buttonWrap.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
}
