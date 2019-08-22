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
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        tableView.register(CarouselTableViewCell.self,
                      forCellReuseIdentifier: CarouselTableViewCell.reusableIdentifier)
        tableView.register(InfoTableViewCell.self,
                           forCellReuseIdentifier: InfoTableViewCell.reusableIdentifier)
        
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
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var height: CGFloat
        if indexPath.row == 0 {
            height = 440
        } else if indexPath.row == 1{
            height = 150
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
            case 0:
                if let cell = tableView.dequeueReusableCell(withIdentifier: CarouselTableViewCell.reusableIdentifier, for: indexPath) as? CarouselTableViewCell {
                    cell.saveImageList = service.screenshotUrls
                    return cell
                }
                return UITableViewCell()
            
            case 1:
                if let cell = tableView.dequeueReusableCell(withIdentifier: InfoTableViewCell.reusableIdentifier, for: indexPath) as? InfoTableViewCell {
                    cell.saveUrlStr = service.trackViewUrl
                    cell.title.text = service.trackName
                    cell.seller.text = service.sellerName
                    cell.price.text = service.formattedPrice.rawValue
                    
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
