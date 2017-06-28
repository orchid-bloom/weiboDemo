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
    
    /**
     *  sourceView
     *  @return UIViewController
     */
    func findViewController(sourceView:UIView?)->(UIViewController?) {
        
        guard let sourceView =  sourceView else {
            return nil
        }
        var target = sourceView as UIResponder?
        
        while target != nil {
            target = target?.next
            if (target? .isKind(of: UIViewController.self))! {
                break;
            }
        }
        return target as? UIViewController
    }
    
    ///rotate Animation
    func rotateViewAnimation()  {
        let tmpSpeed:TimeInterval = 0.5
        let rotationAnimation     = CABasicAnimation(keyPath: "transform.rotation.z");
        rotationAnimation.fromValue = 0
        rotationAnimation.toValue   = (Double.pi/4)*100000
        rotationAnimation.duration  = tmpSpeed*100000
        rotationAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        self.layer .add(rotationAnimation, forKey: nil)
    }
}
