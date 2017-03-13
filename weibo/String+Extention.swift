//
//  String+Extention.swift
//  weibo
//
//  Created by tianXin on 2017/3/13.
//  Copyright © 2017年 tianXin. All rights reserved.
//

import Foundation

extension String {
    var baseUrl:String {
        return DTNetworkConfig.shared.baseUrl!
    }
    static func requestUrl(_ url:String?)-> String{
    return String().baseUrl + "/" + url!
    }
    
}
