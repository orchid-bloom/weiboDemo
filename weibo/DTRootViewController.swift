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
    var tabBarIcons   = [["首页","tabbar_home","tabbar_home_selected"],
                         ["消息","tabbar_message_center","tabbar_message_center_selected"],
                         ["","tabbar_compose_icon_add","tabbar_compose_icon_add_highlighted"],
                         ["发现","tabbar_discover","tabbar_discover_selected"],
                         ["我","tabbar_profile","tabbar_profile_selected"]]
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabBarController()
    }

    /* setTabBarController */
    fileprivate func setTabBarController() {
        var i = 0;
        var viewControllers = [UINavigationController]()
        for _ in tabBarIcons {
            let uNC = DTNavigationController()
            if i == 0 {
                let home = DTHomeViewController()
                uNC.viewControllers = [home]
            }
            viewControllers.append(uNC)
            i += 1
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
        tabBar.backgroundView.backgroundColor = UIColor().tabBarColor
        i = 0;
        for item in tabBar.items! {
            let subArr = tabBarIcons[i]
            let unselectImageName = subArr[1];
            let selectImageName  = subArr[2];
            let unelectImage = UIImage.init(named: unselectImageName)
            let selectImage = UIImage.init(named: selectImageName)
            item.unselectedTitleAttributes = [NSForegroundColorAttributeName:UIColor().navigationTitleColor];
            item.selectedTitleAttributes = [NSForegroundColorAttributeName:UIColor().navigationTitleColor];
            item.title      = subArr[0]
            item.titlePositionAdjustment = UIOffsetMake(0, 2)
            item.setFinishedSelectedImage(selectImage, unselectedImage: unelectImage)
            
            if i == 2 {
                let unselectBgImage = UIImage.init(named: "tabbar_compose_button")
                let selectBgImage   = UIImage.init(named: "tabbar_compose_button_highlighted")
                item.setBackgroundSelectedImage(selectBgImage, unselectedImage: unselectBgImage)
            }
            item.setNeedsDisplay()
            i += 1;
        }
    }
    /* RDVTabBarControllerDelegate */
    func tabBarController(_ tabBarController: RDVTabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        return true
    }
    func tabBarController(_ tabBarController: RDVTabBarController, didSelectViewController viewController: UIViewController) {
        if viewController.isKind(of: DTNavigationController.classForCoder()) {
            let uNC = viewController as! DTNavigationController
            let index = (tabBarViewController?.selectedIndex)!
            switch index {
            case 1:
                if (uNC.viewControllers.count == 0) {
                    let message = DTMessageViewController()
                    uNC.viewControllers = [message]
                }
            case 2:
                if (uNC.viewControllers.count == 0) {
                    let push = DTPushViewController()
                    uNC.viewControllers = [push]
                }
            case 3:
                if (uNC.viewControllers.count == 0) {
                    let fine = DTFineViewController()
                    uNC.viewControllers = [fine]
                }
            case 4:
                if (uNC.viewControllers.count == 0) {
                    let   my = DTMyViewController()
                    uNC.viewControllers = [my]
                }
            default:
                break
            }
        }
    }
}
