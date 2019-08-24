//
//  InfoView.swift
//  StoreCopy
//
//  Created by JinBae Jeong on 2019/08/22.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

protocol webButtonDelegate {
    func webButtonAction(sender: UIButton)
}

protocol shareButtonDelegate {
    func shareButtonAction(sender: UIButton)
}

class InfoView: UIView {

    var webDelegate: webButtonDelegate?
    var shareDelegate: shareButtonDelegate?
    
    var saveUrlStr: String = "" {
        didSet {
            
        }
    }
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        
        return label
    }()
    
    lazy var seller: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        return label
    }()
    
    lazy var price: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        
        return label
    }()
    
    lazy var buttonWrap: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 5
        
        return view
    }()
    
    lazy var webButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("웹에서 보기", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(webButtonAction(sender:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var halfLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        return view
    }()
    
    lazy var shareButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("공유하기", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(shareButtonAction(sender:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var line: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .white
        
        addSubview(title)
        addSubview(seller)
        addSubview(price)
        addSubview(buttonWrap)
        buttonWrap.addSubview(webButton)
        buttonWrap.addSubview(halfLine)
        buttonWrap.addSubview(shareButton)
        addSubview(line)
        
        configureConstraints()
    }

    private func configureConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            title.bottomAnchor.constraint(equalTo: seller.topAnchor, constant: -3),
            seller.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            seller.bottomAnchor.constraint(equalTo: price.topAnchor, constant: -8),
            price.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            price.bottomAnchor.constraint(equalTo: buttonWrap.topAnchor, constant: -12),
            buttonWrap.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            buttonWrap.widthAnchor.constraint(equalTo: widthAnchor, constant: -24),
            buttonWrap.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            buttonWrap.bottomAnchor.constraint(equalTo: line.topAnchor, constant: -10),
            buttonWrap.heightAnchor.constraint(equalToConstant: 50),
            webButton.topAnchor.constraint(equalTo: buttonWrap.topAnchor),
            webButton.leadingAnchor.constraint(equalTo: buttonWrap.leadingAnchor),
            webButton.bottomAnchor.constraint(equalTo: buttonWrap.bottomAnchor),
            webButton.widthAnchor.constraint(equalTo: buttonWrap.widthAnchor, multiplier: 0.5, constant: -0.5),
            webButton.trailingAnchor.constraint(equalTo: halfLine.leadingAnchor),
            halfLine.topAnchor.constraint(equalTo: buttonWrap.topAnchor),
            halfLine.bottomAnchor.constraint(equalTo: buttonWrap.bottomAnchor),
            halfLine.centerXAnchor.constraint(equalTo: buttonWrap.centerXAnchor),
            halfLine.trailingAnchor.constraint(equalTo: shareButton.leadingAnchor),
            shareButton.topAnchor.constraint(equalTo: buttonWrap.topAnchor),
            shareButton.trailingAnchor.constraint(equalTo: buttonWrap.trailingAnchor),
            shareButton.bottomAnchor.constraint(equalTo: buttonWrap.bottomAnchor),
            shareButton.widthAnchor.constraint(equalTo: buttonWrap.widthAnchor, multiplier: 0.5, constant: -0.5),
            line.leadingAnchor.constraint(equalTo: buttonWrap.leadingAnchor),
            line.trailingAnchor.constraint(equalTo: buttonWrap.trailingAnchor),
            line.bottomAnchor.constraint(equalTo: bottomAnchor),
            line.heightAnchor.constraint(equalToConstant: 1)
        ])
        
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
