//
//  ViewController.swift
//  StoreCopy
//
//  Created by JinBae Jeong on 2019/08/21.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit
import SnapKit

class ListViewController: UIViewController {

    // MARK: - Properties
    // Review: [Refactoring] ServiceType 을 외부에서 주입받는 것이 좋지 않을까요?
    let service: ServiceType = Service()
    let keyword: String = "핸드메이드"
    private var list: DataModel? {
        willSet(newValue) {
            guard let info = newValue?.results else { return }
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationController?.navigationItem.largeTitleDisplayMode = .always
        }
    }
    
    func fetchData() {
        service.fetchListDataAPI(term: keyword) { result in
            switch result {
            case .success(let product):
                self.list = product
            case .failure(let error):
                // Review: [사용성] 실패했을때 사용자에게 Alert 같은걸 보여주는 것이 좋지 않을까요~? ㅎ
                print("error")
            }
            
        }
    }
    
    private func configureConstraints() {
        if #available(iOS 11, *) {
            tableView.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectService = contents[indexPath.row]
        let detailVC = DetailViewController(service: selectService)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
