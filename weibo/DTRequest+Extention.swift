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
     - name      获取最新新闻数据
     */
    class func homeTimeLine(requestArgument:[String:Any] , response:@escaping Response) {
        DTRequest().request(method: .get, urlString: API_URL+ARTICLE_LIST, parameters: requestArgument) { (nil, msg, JSON) in
            let json = JSON
            guard let data = json?["data"].arrayObject else{
                return;
            }
            response(data)
        }
    }
}
