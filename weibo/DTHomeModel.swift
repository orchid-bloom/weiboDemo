//
//  DTHomeModel.swift
//  weibo
//
//  Created by tianXin on 2017/3/13.
//  Copyright © 2017年 tianXin. All rights reserved.
//

import UIKit
import Mantle

class DTHomeModel: DTModel {

    /// 文章分类id
    var classid: String?
    /// 文章id
    var id: String?
    /// 文章标题
    var title: String?
    /// 文章来源
    var befrom: String?
    /// 点击量
    var onclick: String?
    /// 评论
    var plnum: String?
    /// 创建文章时间戳
    var newstime: String?
    /// 标题图片url
    var titlepic: String?
    /// 多图数组
    var morepic: [String]?
}

//MARK: - MTLJSONSerializing -
extension DTHomeModel : MTLJSONSerializing {

    class func jsonKeyPathsByPropertyKey() -> [AnyHashable : Any]! {
        let dict = [
        "classid" :"classid",
        "id"      :"id",
        "title"   :"title",
        "befrom"  :"befrom",
        "onclick" :"onclick",
        "plnum"   :"plnum",
        "newstime":"newstime",
        "titlepic":"titlepic",
        "morepic" :"morepic",
        ]
        return dict
    }
}
