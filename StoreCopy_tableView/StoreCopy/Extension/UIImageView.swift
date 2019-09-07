//
//  UIImageView.swift
//  StoreCopy
//
//  Created by JinBae Jeong on 2019/08/22.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloadImageFrom(_ link:String, contentMode: UIView.ContentMode) {
        guard let url = URL(string: link) else {return print("link 가 없어서 함수에서 guard 문에 걸린듯?")}
        URLSession.shared.dataTask( with: url, completionHandler: {
            (data, response, error) -> Void in
            DispatchQueue.main.async {
                self.contentMode =  contentMode
                if let data = data { self.image = UIImage(data: data) }
                // Review: [사용성] 에러 처리가 필요해 보입니다!
            }
            
        }).resume()
    }
}
