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
    let keyword: String = "핸드메이드"
    
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
    }
}
