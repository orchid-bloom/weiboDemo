//
//  DTHomeModel.swift
//  weibo
//
//  Created by tianXin on 2017/3/13.
//  Copyright © 2017年 tianXin. All rights reserved.
//

import UIKit

class DTHomeModel: DTModel {
    var created_at:String?
    var id        :Int64 = 0
    var text      :String?
    var source    :String?
    var favorited :Bool = false
    var truncated :Bool = false
    var in_reply_to_status_id    :String?
    var in_reply_to_user_id      :String?
    var in_reply_to_screen_name      :String?
    var geo       :String?
    var mid       :String?
    var reposts_count  :Int64 = 0
    var comments_count  :Int64 = 0
    var annotations     :[Any]?
    var user      :[String:Any]?
}
