//
//  UIBarButtonItem+Extension.swift
//  weibo
//
//  Created by Tema on 17/3/1.
//  Copyright © 2017年 tianXin. All rights reserved.
//

import Foundation
import UIKit

extension UIBarButtonItem {
    class func creatBarButtonItem(image:UIImage,lightImage:UIImage,title:String,target:Any,action:Selector)->UIBarButtonItem {
        let navBackImage          = image
        let navBackImageHighlight = lightImage
        let button                = UIButton(type:.custom)
        button.setImage(navBackImage, for: .normal)
        button.setImage(navBackImageHighlight, for: .highlighted)
        button.setTitle(title, for: .normal)
        button.setTitle(title, for: .highlighted)
        button.setTitleColor(UIColor().navigationTitleColor, for: .normal)
        button.setTitleColor(UIColor().flashViewColor, for: .highlighted)
        button.titleLabel?.font = DTFont.getFontWithFontType(.DTFontTypeC)
        button.addTarget(target, action:action, for:.touchUpInside)
        button.sizeToFit()
        let barButtonItem         = UIBarButtonItem(customView: button)
        return barButtonItem
    }
}
