//
//  Bundle+Extension.swift
//  weibo
//
//  Created by tianXin on 2017/3/1.
//  Copyright © 2017年 tianXin. All rights reserved.
//

import UIKit

extension Bundle {
    
    //计算型属性返回命名空间
    var namespace : String {
    return infoDictionary!["CFBundleName"] as? String ?? ""
    }
}
