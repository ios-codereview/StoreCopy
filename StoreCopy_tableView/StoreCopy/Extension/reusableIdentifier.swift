//
//  reusableIdentifier.swift
//  StoreCopy
//
//  Created by JinBae Jeong on 2019/08/21.
//  Copyright © 2019 pino. All rights reserved.
//

import Foundation

// Review: [Refactoring] NSObject 범위의 extension으로 설정하지 않는 것이 좋을 것 같습니다 ㅎ
// https://github.com/kimtaesu/MVVMGithubTDD/blob/master/TddMVVMGithub/Utils/SwiftNameIdentifier.swift
// protocol 를 따르는 class 만 reusableIdentifier 제공하도록 하는 것이 효율적입니다
extension NSObject {
    static var reusableIdentifier: String {
        return String(describing: self)
    }
}
