//
//  DTRequest+Extention.swift
//  weibo
//
//  Created by tianXin on 2017/3/13.
//  Copyright © 2017年 tianXin. All rights reserved.
//

import Foundation

extension DTRequest {
    /**
     - name      获取最新weibo数据
     */
    class func homeTimeLine(response:@escaping Response){
        DTRequest().request(method: .get, urlString: "2/statuses/home_timeline.json?", parameters: nil) { (nil, msg, JSON) in
         let json = JSON
            guard let data = json?["statuses"].array else{
                return;
            }
            response(data)
        }
    }
}
