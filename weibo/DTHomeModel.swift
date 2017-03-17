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
//    /// 缓存行高
//    var rowHeight: CGFloat = 0.0
//    /// 缓存偏移量
//    var offsetY: CGFloat = 0.0
    /// 时间戳转换成时间
//    var newstimeString: String?
//    {
//        return newstime!.timeStampToString()
//    }

}

//MARK: - MTLJSONSerializing -
extension DTHomeModel : MTLJSONSerializing {

    class func jsonKeyPathsByPropertyKey() -> [AnyHashable : Any]! {
        let dict = [
        "classid":"classid",
        "id":"id",
        "title":"title",
        "befrom":"befrom",
        "onclick":"onclick",
        "plnum":"plnum",
        "newstime":"newstime",
        "titlepic":"titlepic",
        "morepic":"morepic",
        ]
        return dict
    }
//    class   func jsonTransformer(forKey key: String!) -> ValueTransformer! {
//        if key == "user" {
////            return MTLJSONAdapter.arrayTransformer(withModelClass: DTUser.self)
//            return nil
//        }else if key == "DTStatusPicture" {
////            return MTLJSONAdapter.arrayTransformer(withModelClass: DTStatusPicture.self)
//            return nil
//        }
//        return nil
//    }
}
