//
//  DTPage.swift
//  weibo
//
//  Created by tianXin on 2017/2/28.
//  Copyright © 2017年 tianXin. All rights reserved.
//

import UIKit

class DTPage: NSObject {
    ///当前页数
    var pageIndex = 1
    ///每页数目
    var pageSize  = 10
    ///总页数
    var _totalPages :Int = 0
    var totalPages  :Int { //重写set方法
        set {
            if newValue > pageIndex {
                if newValue%pageSize == 0 {
                    _totalPages = newValue/pageSize
                }else{
                    _totalPages = newValue/pageSize+1
                }
            }else{
                _totalPages = 1
            }
        }
        get {
            return _totalPages
        }
    }
    //增加页数
    func addPageIndex()  {
        pageIndex += 1
    }
}
