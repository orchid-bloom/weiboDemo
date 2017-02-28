//
//  DTRootViewController.swift
//  weibo
//
//  Created by tianXin on 2017/2/27.
//  Copyright © 2017年 tianXin. All rights reserved.
//

import UIKit
import RDVTabBarControllerSwift
import MBProgressHUD

class DTRootViewController: DTViewController ,RDVTabBarControllerDelegate{

    var tabBarViewController : RDVTabBarController?
    var tabBarIcons   = [["首页","tabbar_home","tabbar_home_selected"], ["消息","tabbar_message_center","tabbar_message_center_selected"], ["","tabbar_compose_background_icon_add","tabbar_compose_background_icon_addselect"], ["发现","tabbar_discover","tabbar_discover_selected"],["我","tabbar_profile","tabbar_profile_selected"]]
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabBarController()
    }

    /* setTabBarController */
    fileprivate func setTabBarController() {
        var viewControllers = [UINavigationController]()
        for _ in tabBarIcons {
            let uNC = DTNavigationController()
            viewControllers.append(uNC)
        }
        tabBarViewController = RDVTabBarController()
        tabBarViewController?.viewControllers = viewControllers
        tabBarViewController?.delegate = self
        guard let tabBarViewController = tabBarViewController else {
           return
        }
        self.addChildViewController(tabBarViewController)
        view.addSubview(tabBarViewController.view)
        let tabBar = tabBarViewController.tabBar
        var i = 0;
        for item in tabBar.items! {
            let subArr = tabBarIcons[i]
            let unelectImageName = subArr[1];
            let selectImageName  = subArr[2];
            let unelectImage = UIImage.init(named: unelectImageName)
            let selectImage = UIImage.init(named: selectImageName)
            item.unselectedTitleAttributes = [NSForegroundColorAttributeName:UIColor.black];
            item.selectedTitleAttributes = [NSForegroundColorAttributeName:UIColor.black];
            item.title      = subArr[0]
            item.titlePositionAdjustment = UIOffsetMake(0, 2)
            item.setFinishedSelectedImage(selectImage, unselectedImage: unelectImage)
            item.setNeedsDisplay()
            i += 1;
        }
    }
    /* RDVTabBarControllerDelegate */
    func tabBarController(_ tabBarController: RDVTabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        if viewController.isKind(of: DTNavigationController.classForCoder()) {
            let uNC = viewController as! DTNavigationController
            let index = (tabBarViewController?.selectedIndex)!
            switch index {
            case 0:
                let home = DTHomeViewController()
                uNC.viewControllers = [home]
            case 1:
                let message = DTMessageViewController()
                uNC.viewControllers = [message]
            case 2:
                let push = DTPushViewController()
                uNC.viewControllers = [push]
            case 3:
                let fine = DTFineViewController()
                uNC.viewControllers = [fine]
            case 5:
                let   my = DTMyViewController()
                uNC.viewControllers = [my]
            default:
                break
            }
        }
        return true
    }
    func tabBarController(_ tabBarController: RDVTabBarController, didSelectViewController viewController: UIViewController) {
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        MBProgressHUD.showToastWithString("Successed")
    }
}
