//
//  RatingView.swift
//  StoreCopy
//
//  Created by JinBae Jeong on 2019/08/21.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class RatingView: UIView {

    // MARK: - Properties
    private var starImageViews = [UIImageView]()
    private var averageRating: Double
    private var rating: Double = 5.0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    init(averageRating: Double) {
        self.averageRating = averageRating
        super.init(frame: CGRect.zero)
        
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configure()
    }
    
    private func configure() {
        let starWidth = self.bounds.width / CGFloat(5)
        let starIntCount = Int(averageRating)
        let isHalfStar: Bool = averageRating - Double(starIntCount) > 0
        var starImage: UIImage
        
        for i in 1...5 {
            if i <= starIntCount {
                starImage = UIImage(named: "full")!
            } else {
                starImage = UIImage(named: "empty")!
            }
            
            let starImageView = UIImageView(image: starImage)
            addSubview(starImageView)
            starImageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                starImageView.topAnchor.constraint(equalTo: topAnchor),
                starImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
                starImageView.widthAnchor.constraint(equalToConstant: starWidth),
                starImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: starWidth * CGFloat(i - 1))
            ])
            starImageViews.append(starImageView)
        }
    }
}
