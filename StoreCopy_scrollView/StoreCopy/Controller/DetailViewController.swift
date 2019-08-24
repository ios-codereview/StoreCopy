//
//  DetailViewController.swift
//  StoreCopy
//
//  Created by JinBae Jeong on 2019/08/22.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class DetailViewController: UIViewController {
    
    let service: ResultData
    
    private lazy var detailView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        
        return scrollView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        
        return stackView
    }()
    
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
    
    private lazy var infoView: InfoView = {
        let view = InfoView()
        view.saveUrlStr = service.trackViewUrl
        view.title.text = service.trackName
        view.seller.text = service.sellerName
        view.price.text = service.formattedPrice.rawValue
        
        return view
    }()
    
    private lazy var sizeView: NormalView = {
        let view = NormalView(frame: .zero, titleData: "크기", detailData: service.resource, isActive: false)
        
        return view
    }()
    
    private lazy var ageView: NormalView = {
        let view = NormalView(frame: .zero, titleData: "연령", detailData: service.contentAdvisoryRating.rawValue, isActive: false)
        
        return view
    }()
    
    private lazy var featureView: NormalView = {
        let view = NormalView(frame: .zero, titleData: "새로운 기능", detailData: service.version, isActive: true)
        view.delegate = self
        
        return view
    }()
    
    private lazy var featureDetailView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        textView.text = service.releaseNotes
        textView.isScrollEnabled = false
        textView.isHidden = true
        textView.isEditable = false
        textView.font = UIFont.systemFont(ofSize: 15)
        
        return textView
    }()
    
    private lazy var descriptionView: DescriptionView = {
        let view = DescriptionView()
        view.backgroundColor = .white
        view.data.text = service.description
        
        return view
    }()
    
    private lazy var categoryView: CategoryView = {
        let view = CategoryView()
        view.backgroundColor = .white
        view.title.text = "카테고리"
        view.categoryList = service.genres
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = false
            navigationController?.navigationItem.largeTitleDisplayMode = .never
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
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
        view.addSubview(detailView)
        detailView.addSubview(stackView)
        stackView.addArrangedSubview(carouselCollectionView)
        stackView.addArrangedSubview(infoView)
        stackView.addArrangedSubview(sizeView)
        stackView.addArrangedSubview(ageView)
        stackView.addArrangedSubview(featureView)
        stackView.addArrangedSubview(featureDetailView)
        stackView.addArrangedSubview(descriptionView)
        stackView.addArrangedSubview(categoryView)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        detailView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        stackView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        carouselCollectionView.snp.makeConstraints{
            $0.width.equalTo(UIScreen.main.bounds.width)
            $0.height.equalTo(440)
            $0.top.left.equalToSuperview()
            $0.bottom.equalTo(infoView.snp.top)
        }
        infoView.snp.makeConstraints{
            $0.width.equalTo(carouselCollectionView.snp.width)
        }
        sizeView.snp.makeConstraints{
            $0.width.equalTo(carouselCollectionView.snp.width)
        }
        ageView.snp.makeConstraints{
            $0.width.equalTo(carouselCollectionView.snp.width)
        }
        featureView.snp.makeConstraints{
            $0.width.equalTo(carouselCollectionView.snp.width)
        }
        featureDetailView.snp.makeConstraints{
            $0.width.equalTo(carouselCollectionView.snp.width)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.edges.equalTo(featureDetailView.snp.edges).offset(20)
        }
        descriptionView.snp.makeConstraints{
            $0.width.equalTo(carouselCollectionView.snp.width)
        }
        categoryView.snp.makeConstraints{
            $0.width.equalTo(carouselCollectionView.snp.width)
        }
    }
    
}

extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return service.screenshotUrls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselCollectionViewCell.reusableIdentifier, for: indexPath) as? CarouselCollectionViewCell {
            cell.imgView.kf.setImage(with: URL(string: service.screenshotUrls[indexPath.item]))
            
            return cell
        }
        
        return UICollectionViewCell()
    }
}

extension DetailViewController: webButtonDelegate {
    func webButtonAction(sender: UIButton) {}
}

extension DetailViewController: shareButtonDelegate {
    func shareButtonAction(sender: UIButton) {}
}

extension DetailViewController: ExpandDelegate {
    func expandViewTapped() {
        UIView.animate(withDuration: 0.5) {
            self.featureDetailView.isHidden = !self.featureDetailView.isHidden
            
            self.featureDetailView.layoutIfNeeded()
        }
    }
}
