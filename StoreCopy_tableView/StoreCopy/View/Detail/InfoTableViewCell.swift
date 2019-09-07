//
//  InfoView.swift
//  StoreCopy
//
//  Created by JinBae Jeong on 2019/08/22.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit
import SnapKit

protocol webButtonDelegate {
    func webButtonAction(sender: UIButton)
}

protocol shareButtonDelegate {
    func shareButtonAction(sender: UIButton)
}

class InfoTableViewCell: UITableViewCell {

    // Review: [성능] weak 키워드를 붙여야합니다. 순환참조가 발생합니다.
    var webDelegate: webButtonDelegate?
    var shareDelegate: shareButtonDelegate?
    
    var saveUrlStr: String = "" {
        didSet {
            
        }
    }
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        
        return label
    }()
    
    lazy var seller: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        return label
    }()
    
    lazy var price: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        
        return label
    }()
    
    lazy var buttonWrap: UIView = {
        let view = UIView()
        view.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 5
        
        return view
    }()
    
    lazy var webButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("웹에서 보기", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(webButtonAction(sender:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var halfLine: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        return view
    }()
    
    lazy var shareButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("공유하기", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(shareButtonAction(sender:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var line: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        [title, seller, price, buttonWrap, line].forEach{ contentView.addSubview($0) }
        [webButton, halfLine, shareButton].forEach { buttonWrap.addSubview($0) }
        
        configureConstraints()
    }

    private func configureConstraints() {
        title.snp.makeConstraints{
            $0.top.equalTo(contentView.snp.top)
            $0.left.equalTo(contentView.snp.left).offset(12)
            $0.bottom.equalTo(seller.snp.top).offset(-3)
        }
        
        seller.snp.makeConstraints{
            $0.left.equalTo(title.snp.left)
            $0.bottom.equalTo(price.snp.top).offset(-8)
        }
        
        price.snp.makeConstraints{
            $0.left.equalTo(title.snp.left)
            $0.bottom.equalTo(buttonWrap.snp.top).offset(-12)
        }
        
        buttonWrap.snp.makeConstraints{
            $0.left.equalTo(title.snp.left)
            $0.width.equalTo(contentView.snp.width).offset(-24)
            $0.right.equalTo(contentView.snp.right).offset(-12)
            $0.bottom.equalTo(line.snp.top).offset(-10)
            $0.height.equalTo(50)
        }
        
        webButton.snp.makeConstraints{
            $0.top.equalTo(buttonWrap.snp.top)
            $0.left.equalTo(buttonWrap.snp.left)
            $0.bottom.equalTo(buttonWrap.snp.bottom)
            $0.width.equalTo(buttonWrap.snp.width).offset(-0.5).multipliedBy(0.5)
            $0.right.equalTo(halfLine.snp.left)
        }
        
        halfLine.snp.makeConstraints{
            $0.top.equalTo(buttonWrap.snp.top)
            $0.bottom.equalTo(buttonWrap.snp.bottom)
            $0.centerX.equalTo(buttonWrap.snp.centerX)
            $0.right.equalTo(shareButton.snp.left)
        }
        
        shareButton.snp.makeConstraints{
            $0.top.equalTo(buttonWrap.snp.top)
            $0.right.equalTo(buttonWrap.snp.right)
            $0.bottom.equalTo(buttonWrap.snp.bottom)
            $0.width.equalTo(buttonWrap.snp.width).offset(-0.5).multipliedBy(0.5)
        }
        
        line.snp.makeConstraints{
            $0.left.equalTo(buttonWrap.snp.left)
            $0.right.equalTo(buttonWrap.snp.right)
            $0.bottom.equalTo(contentView.snp.bottom)
            $0.height.equalTo(1)
        }
        
    }
    
    @objc private func webButtonAction(sender: UIButton) {
        if let url = URL(string: saveUrlStr) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
        webDelegate?.webButtonAction(sender: sender)
    }
    
    @objc private func shareButtonAction(sender: UIButton) {
        if let shareUrl = URL(string: saveUrlStr) {
            let activityViewController = UIActivityViewController(activityItems: [saveUrlStr],
                                                                  applicationActivities: nil)
            UIApplication.shared.keyWindow?.rootViewController?.present(activityViewController, animated: true, completion: nil)
            
        }
        shareDelegate?.shareButtonAction(sender: sender)
    }
    
}
