//
//  UIButton+Extention.swift
//  weibo
//
//  Created by tianXin on 2017/3/9.
//  Copyright © 2017年 tianXin. All rights reserved.
//

import UIKit

extension UIButton {
    class func creatButton(frame:CGRect?,
                           title:String?,
                      titleColor:UIColor?,
                 lightTitleColor:UIColor?,
                           image:UIImage?,
                      lightImage:UIImage?,
                          target:Any?,
                      action:Selector)->UIButton {
            let button                = UIButton(type:.custom)
            button.setImage(image, for: .normal)
            button.setImage(lightImage, for: .highlighted)
            button.setTitle(title, for: .normal)
            button.setTitle(title, for: .highlighted)
            button.setTitleColor(titleColor, for: .normal)
            button.setTitleColor(lightTitleColor, for: .highlighted)
            button.titleLabel?.font = DTFont.getFontWithFontType(.DTFontTypeC)
            button.addTarget(target, action:action, for:.touchUpInside)
            button.sizeToFit()
            button.frame = frame!
        return button
    }
}
