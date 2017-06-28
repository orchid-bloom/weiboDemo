//
//  UITableView+extenion.swift
//  weibo
//
//  Created by tianXin on 2017/6/28.
//  Copyright © 2017年 tianXin. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    /**
     *  分割线宽度设为屏幕宽度
     */
    func setSeparatorInsetAndLayoutMargins() {
        if self.responds(to: #selector(setter: (separatorInset))) {
            self.separatorInset = UIEdgeInsets.zero
        }
        if self.responds(to: #selector(setter: (layoutMargins))) {
            self.layoutMargins = UIEdgeInsets.zero
        }
    }
}
