//
//  reusableIdentifier.swift
//  StoreCopy
//
//  Created by JinBae Jeong on 2019/08/21.
//  Copyright © 2019 pino. All rights reserved.
//

import Foundation

extension NSObject {
    static var reusableIdentifier: String {
        return String(describing: self)
    }
}
