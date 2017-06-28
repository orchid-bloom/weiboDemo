//
//  Dictionary+Extension.swift
//  weibo
//
//  Created by tianXin on 2017/6/28.
//  Copyright © 2017年 tianXin. All rights reserved.
//

import Foundation

extension Dictionary {

    func jsonStringWithPrettyPrint() -> String? {
       
        guard let data = try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted) else {
            
            print("data is nil")
            return nil
        }
        return String(data: data, encoding: .utf8)
    }
    
}
