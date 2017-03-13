//
//  DTUser.swift
//  weibo
//
//  Created by tianXin on 2017/3/13.
//  Copyright © 2017年 tianXin. All rights reserved.
//

import UIKit

class DTUser: DTModel {
var id      :Int64 = 0
var screen_name     :String?
    var name        :String?
    var province    :String?
    var city        :String?
    var location    :String?
    var url         :String?
    var profile_image_url    :String?
    var domain      :String?
    var gender      :String?
    var followers_count      :Int64 = 0
    var friends_count      :Int64 = 0
    var statuses_count      :Int64 = 0
    var favourites_count      :Int64 = 0
    var created_at    :String?
    var following      :Bool = false
    var allow_all_act_msg      :Bool = false
    var geo_enabled      :Bool = false
    var verified      :Bool = false
    var allow_all_comment      :Bool = false
    var remark        :String?
    var avatar_large    :String?
    var verified_reason    :String?
    var follow_me      :Bool = false
    var online_status      :Int64 = 0
    var bi_followers_count      :Int64 = 0
}
