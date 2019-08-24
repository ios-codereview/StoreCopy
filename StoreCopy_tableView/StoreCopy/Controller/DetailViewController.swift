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
    var isToggle: Bool = true
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 60
        
        tableView.register(CarouselTableViewCell.self,
                           forCellReuseIdentifier: CarouselTableViewCell.reusableIdentifier)
        tableView.register(InfoTableViewCell.self,
                           forCellReuseIdentifier: InfoTableViewCell.reusableIdentifier)
        tableView.register(NormalTableViewCell.self,
                           forCellReuseIdentifier: NormalTableViewCell.reusableIdentifier)
        tableView.register(FeatureTableViewCell.self, forCellReuseIdentifier: FeatureTableViewCell.reusableIdentifier)
        tableView.register(DescriptionTableViewCell.self, forCellReuseIdentifier: DescriptionTableViewCell.reusableIdentifier)
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.reusableIdentifier)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        
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
        
        view.addSubview(tableView)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 4 {
            if isToggle == false {
                isToggle = true
            } else {
                isToggle = false
            }
            tableView.beginUpdates()
            tableView.reloadRows(at: [IndexPath.init(row: 4, section: 0)], with: .none)
            tableView.endUpdates()
        }
    }
}
extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: CarouselTableViewCell.reusableIdentifier, for: indexPath) as? CarouselTableViewCell {
                cell.saveImageList = service.screenshotUrls
                cell.selectionStyle = .none
                return cell
            }
            return UITableViewCell()
            
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: InfoTableViewCell.reusableIdentifier, for: indexPath) as? InfoTableViewCell {
                cell.selectionStyle = .none
                cell.saveUrlStr = service.trackViewUrl
                cell.title.text = service.trackName
                cell.seller.text = service.sellerName
                cell.price.text = service.formattedPrice.rawValue
                
                return cell
            }
            return UITableViewCell()
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: NormalTableViewCell.reusableIdentifier, for: indexPath) as? NormalTableViewCell {
                cell.selectionStyle = .none
                cell.title.text = "크기"
                cell.data.text = service.resource
                
                return cell
            }
            return UITableViewCell()
        case 3:
            if let cell = tableView.dequeueReusableCell(withIdentifier: NormalTableViewCell.reusableIdentifier, for: indexPath) as? NormalTableViewCell {
                cell.selectionStyle = .none
                cell.title.text = "연령"
                cell.data.text = service.contentAdvisoryRating.rawValue
                
                return cell
            }
            return UITableViewCell()
        case 4:
            if let cell = tableView.dequeueReusableCell(withIdentifier: FeatureTableViewCell.reusableIdentifier, for: indexPath) as? FeatureTableViewCell {
                cell.selectionStyle = .none
                cell.title.text = "새로운 기능"
                cell.data.text = service.version
                
                let angle: CGFloat = self.isToggle ? 0.0 : .pi
                cell.expandArrow.transform = CGAffineTransform(rotationAngle: angle)
                
                if isToggle == true {
                    UIView.animate(withDuration: 0.5) {
                        cell.bottomView.heightAnchor.constraint(equalToConstant: 0).isActive = true
                        cell.bottomView.isHidden = true
                        cell.bottomViewText.isHidden = true
                    }
                } else {
                    UIView.animate(withDuration: 0.5) {
                        cell.bottomView.heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
                        cell.bottomView.isHidden = false
                        cell.bottomViewText.isHidden = false
                    }
                }
                cell.bottomViewText.text = service.releaseNotes
                
                return cell
            }
            return UITableViewCell()
        case 5:
            if let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionTableViewCell.reusableIdentifier, for: indexPath) as? DescriptionTableViewCell {
                cell.selectionStyle = .none
                cell.data.text = service.description
                
                return cell
            }
            return UITableViewCell()
        case 6:
            if let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.reusableIdentifier, for: indexPath) as? CategoryTableViewCell {
                cell.selectionStyle = .none
                cell.title.text = "카테고리"
                cell.categoryList = service.genres
                
                return cell
            }
            return UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
}

extension DetailViewController: webButtonDelegate {
    func webButtonAction(sender: UIButton) {}
}

extension DetailViewController: shareButtonDelegate {
    func shareButtonAction(sender: UIButton) {}
}
