//
//  CarouselCollectionViewCell.swift
//  StoreCopy
//
//  Created by JinBae Jeong on 2019/08/22.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit
import SnapKit

class CarouselCollectionViewCell: UICollectionViewCell {
    let imgView: UIImageView = {
        let imgView = UIImageView()
        imgView.clipsToBounds = true
        imgView.contentMode = .scaleAspectFill
        return imgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imgView)
        configureConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(screenshotUrlString: UIImage?) {
        imgView.image = screenshotUrlString
    }
    
    private func configureConstraints() {
        imgView.snp.makeConstraints{
            $0.edges.equalTo(contentView.snp.edges)
        }
    }
}
