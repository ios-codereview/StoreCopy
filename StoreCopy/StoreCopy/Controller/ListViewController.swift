//
//  ViewController.swift
//  StoreCopy
//
//  Created by JinBae Jeong on 2019/08/21.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    // MARK: - Properties
    let service: ServiceType = Service()
    let keyword: String = "핸드메이드"
    private var list: DataModel? {
        didSet {
            guard let info = list?.results else { return }
            self.contents = info
        }
    }
    
    private var contents: [ResultData] = [] {
        didSet {
            guard !contents.isEmpty else { return }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ListCell.self, forCellReuseIdentifier: ListCell.reusableIdentifier)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        title = keyword
        
        configureConstraints()
        
        fetchData()
    }
    
    func fetchData() {
        service.fetchListDataAPI(term: keyword) { result in
            switch result {
            case .success(let product):
                self.list = product
            case .failure(let error):
                print("error")
            }
            
        }
    }
    
    private func configureConstraints() {
        if #available(iOS 11, *) {
            let guide = view.safeAreaLayoutGuide
            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: guide.topAnchor),
                tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
                tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
                tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            ])
        }
    }


}

extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ListCell.reusableIdentifier, for: indexPath) as? ListCell {
            let listData = self.contents[indexPath.row]
            cell.configure(listData: listData, iconImage: .none)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 546
    }
}

//extension ListViewController: UITableViewDataSourcePrefetching {
//    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
//        <#code#>
//    }
//}
