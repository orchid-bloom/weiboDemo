//
//  UIView+Extension.swift
//  weibo
//
//  Created by tianXin on 2017/3/3.
//  Copyright © 2017年 tianXin. All rights reserved.
//

import UIKit

extension UIView {
    
    var x:CGFloat {
        return self.frame.origin.x
    }
    var y:CGFloat {
        return self.frame.origin.y
    }
    var width:CGFloat {
        return self.frame.width
    }
    var height:CGFloat {
        return self.frame.height
    }
    var origin :CGPoint {
        return self.frame.origin
    }
    var size  :CGSize {
        return self.frame.size
    }
    var centerPosition :CGPoint {
        return self.center
    }    
}
