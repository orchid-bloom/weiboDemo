//
//  DTFont.swift
//  weibo
//
//  Created by tianXin on 2017/3/1.
//  Copyright © 2017年 tianXin. All rights reserved.
//

import UIKit

enum DTFontType {
    case DTFontTypeA /// 导航栏标题
    case DTFontTypeB /// 标题
    case DTFontTypeC /// 内容
    case DTFontTypeD /// 小号字
    case DTFontTypeE /// 列表标记行专用
}
enum DTTitleFontType {
    case DTTitleFontTypeA  /// 导航栏标题
    case DTTitleFontTypeB  /// 标题
    case DTTitleFontTypeC  /// 内容
}

class DTFont: UIFont {

    class func getFontWithFontType( _ fontType:DTFontType) -> UIFont {
        var font:UIFont
        switch fontType {
        case .DTFontTypeA:
            font = UIFont.systemFont(ofSize: 38/2)
        case .DTFontTypeB:
            font = UIFont.systemFont(ofSize: 34/2)
        case .DTFontTypeC:
            font = UIFont.systemFont(ofSize: 30/2)
        case .DTFontTypeD:
            font = UIFont.systemFont(ofSize: 26/2)
        case .DTFontTypeE:
            font = UIFont.systemFont(ofSize: 20/2)
        }
        return font
    }
    
}
