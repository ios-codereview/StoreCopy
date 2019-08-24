//
//  Network.swift
//  StoreCopy
//
//  Created by JinBae Jeong on 2019/08/21.
//  Copyright © 2019 pino. All rights reserved.
//

import Foundation

class Service: ServiceType {
    
    func fetchListDataAPI(term: String, completion: @escaping (Result<DataModel, ServiceError>) -> Void) {
        
        let str = "https://itunes.apple.com/kr/search?term=\(term)&country=kr&media=software"
        let encoded = str.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        
        guard let url = URL(string: encoded!) else { return print("guard get url fail") }
        print(url)
        
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else { return completion(.failure(.clientError))}
            guard let response = response as? HTTPURLResponse,
                (200..<300) ~= response.statusCode else {
                    print("error")
                    return completion(.failure(.invalidStatusCode))}
            guard let data = data else {
                print("error")
                return completion(.failure(.noData))
            }
            print("data: ", data)
            if let listAPI = try? JSONDecoder().decode(DataModel.self, from: data) {
                print("success: ", listAPI)
                completion(.success(listAPI))
            }
            }.resume()
    }
    
}
