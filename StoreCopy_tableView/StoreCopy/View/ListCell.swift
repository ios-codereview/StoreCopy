//
//  ListCell.swift
//  StoreCopy
//
//  Created by JinBae Jeong on 2019/08/21.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit
import Kingfisher
import SnapKit

class ListCell: UITableViewCell {
    // Review: [사용성] 화면을 전환화면 이미지만 나옵니다 ㅎ
    // MARK: - Properties
    private var listData: ResultData!
    private let containerLayout: UIView = {
        let view = UIView()
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
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    // 타이틀 & 판매자명 뷰
    private lazy var midView: UIView = {
        let view = UIView()
        //        view.backgroundColor = .white
        
        return view
    }()
    
    private lazy var divideLine: UIView = {
        let view = UIView()
        view.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.layer.borderWidth = 1
        
        return view
    }()
    
    // 카테고리, 가격, 평점 뷰
    private lazy var lastView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        return label
    }()
    
    private lazy var seller: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        return label
    }()
    
    private lazy var category: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        return label
    }()
    
    private lazy var price: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        
        return label
    }()
    
    private lazy var rating: RatingView = {
        let view = RatingView(averageRating: listData.averageUserRating ?? 0.0)
        
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        configureConstraints()
    }
    
    func configure(listData: ResultData, iconImage: UIImage?) {
        self.listData = listData
        
        [containerLayout, imgView, midView, divideLine, lastView].forEach{ contentView.addSubview($0) }
        [title, seller].forEach{ midView.addSubview($0) }
        [category, price, rating].forEach{ lastView.addSubview($0) }
        
        selectionStyle = .none
        backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
        
        let imageUrl = URL(string: listData.artworkUrl512)!
        imgView.kf.setImage(with: imageUrl)
        title.text = listData.trackName
        seller.text = listData.sellerName
        category.text = listData.genres[0]
        price.text = listData.formattedPrice.rawValue
    }
    
    private func configureConstraints() {
        containerLayout.snp.makeConstraints{
            $0.top.left.equalToSuperview().offset(8)
            $0.bottom.right.equalToSuperview().offset(-8)
        }
        
        imgView.snp.makeConstraints{
            $0.top.equalTo(containerLayout.snp.top)
            $0.left.equalTo(containerLayout.snp.left)
            $0.right.equalTo(containerLayout.snp.right)
            $0.bottom.equalTo(midView.snp.top)
            $0.width.equalTo(containerLayout.snp.width)
            $0.height.equalTo(imgView.snp.width)
        }
        
        midView.snp.makeConstraints{
            $0.left.equalTo(containerLayout.snp.left)
            $0.right.equalTo(containerLayout.snp.right)
            $0.bottom.equalTo(divideLine.snp.top)
        }
        
        title.snp.makeConstraints{
            $0.top.equalTo(midView.snp.top).offset(10)
            $0.left.equalTo(midView.snp.left).offset(10)
            $0.width.equalTo(midView.snp.width)
            $0.bottom.equalTo(seller.snp.top).offset(-5)
        }
        
        seller.snp.makeConstraints{
            $0.left.equalTo(title.snp.left)
            $0.bottom.equalTo(midView.snp.bottom).offset(-10)
        }
        
        divideLine.snp.makeConstraints{
            $0.left.equalTo(midView.snp.left)
            $0.right.equalTo(midView.snp.right)
            $0.bottom.equalTo(lastView.snp.top)
            $0.height.equalTo(1)
        }
        
        lastView.snp.makeConstraints{
            $0.left.equalTo(containerLayout.snp.left)
            $0.right.equalTo(containerLayout.snp.right)
            $0.bottom.equalTo(containerLayout.snp.bottom)
            $0.height.equalTo(midView.snp.height)
        }
        
        category.snp.makeConstraints{
            $0.top.equalTo(lastView.snp.top).offset(10)
            $0.left.equalTo(lastView.snp.left).offset(10)
            $0.bottom.equalTo(price.snp.top).offset(-5)
        }
        
        price.snp.makeConstraints{
            $0.left.equalTo(category.snp.left)
            $0.bottom.equalTo(lastView.snp.bottom).offset(-10)
        }
        
        rating.snp.makeConstraints{
            $0.top.equalTo(lastView.snp.top).offset(5)
            $0.right.equalTo(lastView.snp.right).offset(-15)
            $0.width.equalTo(100)
            $0.height.equalTo(20)
        }
    }
}
