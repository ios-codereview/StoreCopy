//
//  ServiceType.swift
//  StoreCopy
//
//  Created by JinBae Jeong on 2019/08/22.
//  Copyright © 2019 pino. All rights reserved.
//

import Foundation

protocol ServiceType {
    func fetchListDataAPI(term: String, completion: @escaping (Result<DataModel, ServiceError>) -> Void)
}
