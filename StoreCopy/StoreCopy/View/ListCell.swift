//
//  ListCell.swift
//  StoreCopy
//
//  Created by JinBae Jeong on 2019/08/21.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {

    // MARK: - Properties
    private var listData: ResultData!
    private let containerLayout: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.backgroundColor = .white
        
        return view
    }()
    
    // 로고 이미지뷰
    private lazy var imgView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    // 타이틀 & 판매자명 뷰
    private lazy var midView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .white
        
        return view
    }()
    
    private lazy var divideLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.layer.borderWidth = 1
        
        return view
    }()

    // 카테고리, 가격, 평점 뷰
    private lazy var lastView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .white
        
        return view
    }()
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        return label
    }()
    
    private lazy var seller: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        return label
    }()
    
    private lazy var category: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        return label
    }()
    
    private lazy var price: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        
        return label
    }()
    
    private lazy var rating: RatingView = {
        let view = RatingView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        configureConstraints()
    }
    
    func configure(listData: ResultData, iconImage: UIImage?) {
        self.listData = listData
        contentView.addSubview(containerLayout)
        contentView.addSubview(imgView)
        
        contentView.addSubview(midView)
        midView.addSubview(title)
        midView.addSubview(seller)
        
        contentView.addSubview(divideLine)
        
        contentView.addSubview(lastView)
        lastView.addSubview(category)
        lastView.addSubview(price)
        lastView.addSubview(rating)
        
        selectionStyle = .none
        backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
        
        let imageUrl = URL(string: listData.artworkUrl512)!
        let imageData = try! Data(contentsOf: imageUrl)
        
        imgView.image = UIImage(data: imageData)
        title.text = listData.trackName
        seller.text = listData.sellerName
        category.text = listData.genres[0]
        price.text = listData.formattedPrice.rawValue
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            containerLayout.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            containerLayout.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            containerLayout.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            containerLayout.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            imgView.topAnchor.constraint(equalTo: containerLayout.topAnchor),
            imgView.leadingAnchor.constraint(equalTo: containerLayout.leadingAnchor),
            imgView.trailingAnchor.constraint(equalTo: containerLayout.trailingAnchor),
            imgView.bottomAnchor.constraint(equalTo: midView.topAnchor),
            imgView.heightAnchor.constraint(equalTo: imgView.widthAnchor),
            
            midView.leadingAnchor.constraint(equalTo: containerLayout.leadingAnchor),
            midView.trailingAnchor.constraint(equalTo: containerLayout.trailingAnchor),
            midView.bottomAnchor.constraint(equalTo: divideLine.topAnchor),
            title.topAnchor.constraint(equalTo: midView.topAnchor, constant: 10),
            title.leadingAnchor.constraint(equalTo: midView.leadingAnchor, constant: 10),
            title.widthAnchor.constraint(equalTo: midView.widthAnchor),
            title.bottomAnchor.constraint(equalTo: seller.topAnchor, constant: -5),
            seller.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            seller.bottomAnchor.constraint(equalTo: midView.bottomAnchor, constant: -10),
            
            divideLine.leadingAnchor.constraint(equalTo: midView.leadingAnchor),
            divideLine.trailingAnchor.constraint(equalTo: midView.trailingAnchor),
            divideLine.bottomAnchor.constraint(equalTo: lastView.topAnchor),
            
            lastView.leadingAnchor.constraint(equalTo: containerLayout.leadingAnchor),
            lastView.trailingAnchor.constraint(equalTo: containerLayout.trailingAnchor),
            lastView.bottomAnchor.constraint(equalTo: containerLayout.bottomAnchor),
            lastView.heightAnchor.constraint(equalTo: midView.heightAnchor),
            category.topAnchor.constraint(equalTo: lastView.topAnchor, constant: 10),
            category.leadingAnchor.constraint(equalTo: lastView.leadingAnchor, constant: 10),
            category.bottomAnchor.constraint(equalTo: price.topAnchor, constant: -5),
            price.leadingAnchor.constraint(equalTo: category.leadingAnchor),
            price.bottomAnchor.constraint(equalTo: lastView.bottomAnchor, constant: -10),
        ])
    }
}
