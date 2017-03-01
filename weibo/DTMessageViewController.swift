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
        styleNavBar()
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
        let button = UIButton(type:.custom)
        button.setTitle("发现群", for: .normal)
        button.setTitle("发现群", for: .highlighted)
        button.addTarget(self, action:#selector(backTapped(sender:)), for:.touchUpInside)
        button.setTitleColor(UIColor().navigationTitleColor, for: .normal)
        button.setTitleColor(UIColor().flashViewColor, for: .highlighted)
        button.titleLabel?.font = DTFont.getFontWithFontType(.DTFontTypeC)
        button.sizeToFit()
        let barButtonItem = UIBarButtonItem(customView: button)
        return barButtonItem
    }
    override func addCustomRightBarButtonItem()-> (UIBarButtonItem)  {
        let backBtn = UIButton(type: .custom)
        backBtn.setImage(UIImage.init(named: "navigationbar_icon_newchat"), for: .normal)
        backBtn.setImage(UIImage.init(named: "navigationbar_icon_newchat_highlight"), for: .highlighted)
        backBtn.addTarget(self, action: #selector(customItemClicked), for: .touchUpInside)
        backBtn.sizeToFit()
        let barButtonItem = UIBarButtonItem(customView: backBtn)
        return barButtonItem
    }
    override func backTapped (sender:Any) {
        
    }
    override func customItemClicked() {
        
    }
}
