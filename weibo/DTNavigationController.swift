//
//  DTNavigationController.swift
//  weibo
//
//  Created by Tema on 17/2/27.
//  Copyright © 2017年 tianXin. All rights reserved.
//

import UIKit

class DTNavigationController: UINavigationController ,UIGestureRecognizerDelegate{

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let target = self.interactivePopGestureRecognizer?.delegate
        let pan = UIPanGestureRecognizer(target: target, action: Selector("handleNavigationTransition:"))
        view.addGestureRecognizer(pan)
        self.interactivePopGestureRecognizer?.isEnabled = false
        pan.delegate = self
    }
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if self.viewControllers.count > 1 {
            return true
        }else{
            return false
        }
    }

}
