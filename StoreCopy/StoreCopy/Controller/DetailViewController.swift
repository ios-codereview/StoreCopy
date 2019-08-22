//
//  DetailViewController.swift
//  StoreCopy
//
//  Created by JinBae Jeong on 2019/08/22.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

     let service: ResultData
    
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
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    init(service: ResultData) {
        self.service = service

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = false
        }
        
        view.addSubview(carouselCollectionView)
        view.addSubview(tableView)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                carouselCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
                carouselCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                carouselCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                carouselCollectionView.bottomAnchor.constraint(equalTo: tableView.topAnchor),
                carouselCollectionView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2 - 30),
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                ])
        }
    }
}

extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        var height: CGFloat
        if indexPath.row == 0 {
            height = 500
        } else {
            height = 50
        }

        return height
    }
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
            
            default:
                return UITableViewCell()
        }
    }
}

extension DetailViewController: UICollectionViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
}

extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return service.screenshotUrls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselCollectionViewCell.reusableIdentifier, for: indexPath) as? CarouselCollectionViewCell {
            cell.imgView.downloadImageFrom(service.screenshotUrls[indexPath.item], contentMode: .scaleAspectFill)
            
            return cell
        }
        
        return UICollectionViewCell()
    }
}
