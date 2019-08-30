//
//  CarouselTableViewCell.swift
//  StoreCopy
//
//  Created by JinBae Jeong on 2019/08/22.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit
import Kingfisher
import SnapKit

class CarouselTableViewCell: UITableViewCell {

    var saveImageList: [String] = []{
        didSet {
            reloadImageList()
        }
    }
    
    private lazy var carouselCollectionView: UICollectionView = {
        let layout = StretchyHeaderLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2 + 50, height: UIScreen.main.bounds.height / 2 - 30)
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.contentInset = UIEdgeInsets(top: 0, left: 8, bottom: 8, right: 8)
        view.dataSource = self
        view.isPagingEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .white
        
        view.register(CarouselCollectionViewCell.self, forCellWithReuseIdentifier: CarouselCollectionViewCell.reusableIdentifier)
        
        return view
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        contentView.addSubview(carouselCollectionView)
        configureConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadImageList() {
        carouselCollectionView.reloadData()
    }
    
    private func configureConstraints() {
        
        carouselCollectionView.snp.makeConstraints{
            $0.top.equalTo(contentView.snp.top)
            $0.left.equalTo(contentView.snp.left)
            $0.bottom.equalTo(contentView.snp.bottom)
            $0.right.equalTo(contentView.snp.right)
            $0.height.equalTo(440)
        }
    }

}

extension CarouselTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return saveImageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselCollectionViewCell.reusableIdentifier, for: indexPath) as? CarouselCollectionViewCell {
            cell.imgView.kf.setImage(with: URL(string: saveImageList[indexPath.item]))
            
            return cell
        }
        
        return UICollectionViewCell()
    }
}
