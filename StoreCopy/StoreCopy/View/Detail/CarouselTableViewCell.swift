//
//  CarouselTableViewCell.swift
//  StoreCopy
//
//  Created by JinBae Jeong on 2019/08/22.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class CarouselTableViewCell: UITableViewCell {

    var saveImageList: [String] = []{
        didSet {
            print("### :", self.saveImageList.count)
            reloadImageList()
        }
    }
    
    private lazy var carouselCollectionView: UICollectionView = {
        let layout = StretchyHeaderLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2 + 50, height: UIScreen.main.bounds.height / 2 - 30)
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.contentInset = UIEdgeInsets(top: 0, left: 8, bottom: 8, right: 8)
        view.translatesAutoresizingMaskIntoConstraints = false
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
        NSLayoutConstraint.activate([
            carouselCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            carouselCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            carouselCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            carouselCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }

}

extension CarouselTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return saveImageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselCollectionViewCell.reusableIdentifier, for: indexPath) as? CarouselCollectionViewCell {
            cell.imgView.downloadImageFrom(saveImageList[indexPath.item], contentMode: .scaleAspectFill)
            
            return cell
        }
        
        return UICollectionViewCell()
    }
}
