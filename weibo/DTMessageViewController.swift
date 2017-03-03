//
//  DTMessageViewController.swift
//  weibo
//
//  Created by Tema on 17/2/27.
//  Copyright © 2017年 tianXin. All rights reserved.
//

import UIKit

class DTMessageViewController: DTViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if (self.rdv_tabBarController?.tabBarHidden)! {
            self.rdv_tabBarController?.setTabBarHidden(false, animated: true)
        }
        styleNavBar()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if (self.navigationController?.viewControllers.count)! > 1 {
            self.rdv_tabBarController?.setTabBarHidden(true, animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "消息"
        
    }
    override func styleNavBar (){
        super.styleNavBar()
    }
    override func createCustomNavigationBar ()->(UINavigationBar) {
        let newNavBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: ScreenWidth, height: 44))
        newNavBar.barTintColor = UIColor().navigationColor
        let newItem   = UINavigationItem()
        let titleLabel = UILabel()
        titleLabel.text = self.title
        titleLabel.font = DTFont.getFontWithFontType(.DTFontTypeA)
        titleLabel.textColor = UIColor().navigationTitleColor
        titleLabel.sizeToFit()
        newItem.titleView = titleLabel
        newItem.leftBarButtonItems = [self.backNavigationItem()]
        newItem.rightBarButtonItems = [self.addCustomRightBarButtonItem()]
        newNavBar.items = [newItem]
        return newNavBar
    }
    override func backNavigationItem()-> (UIBarButtonItem) {
        let barButtonItem = UIBarButtonItem.creatBarButtonItem(image: nil, lightImage: nil, title: "发现群", target: self, action: #selector(backTapped(sender:)))
        return barButtonItem
    }
    override func addCustomRightBarButtonItem()-> (UIBarButtonItem)  {
        guard   let navBackImage          = UIImage.init(named: "navigationbar_icon_newchat"),
                let navBackImageHighlight = UIImage.init(named: "navigationbar_icon_newchat_highlight") else {
             return UIBarButtonItem()
        }
        let barButtonItem = UIBarButtonItem.creatBarButtonItem(image: navBackImage, lightImage: navBackImageHighlight, title: nil, target: self, action: #selector(customItemClicked))
        return barButtonItem
    }
    override func backTapped (sender:Any) {
        print("message backTapped")
    }
    override func customItemClicked() {
        print("message customItemClicked")
    }
}
