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
        
        // Review: [Refactoring] 함수 내부에서 url 를 지정하면 변경에 취약합니다~
        // func fetchListDataAPI(request: URLRequest..)
        // URLRequest 를 parameter 로 전달받는 것이 좋아 보입니다!
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
