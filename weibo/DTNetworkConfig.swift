//
//  DTNetworkConfig.swift
//  weibo
//
//  Created by tianXin on 2017/3/4.
//  Copyright © 2017年 tianXin. All rights reserved.
//

import UIKit
enum DTSever {
    case SeverDEV
    case SeverTEST
    case SeverRELEASE
}

public final class DTNetworkConfig: NSObject {

    var baseUrl : String?
    
    fileprivate static let _shared = DTNetworkConfig()
    fileprivate override init() {
        
    }
    public static var shared:DTNetworkConfig {
        //处理格外事情
        
        return _shared
    }
    
    func config(sever:DTSever)-> String {
        switch sever {
        case .SeverDEV:
            baseUrl = ""
        case .SeverTEST:
            baseUrl = ""
        case .SeverRELEASE:
            baseUrl = ""
       }
        baseUrl = BASE_URL
        return baseUrl!
    }
}
