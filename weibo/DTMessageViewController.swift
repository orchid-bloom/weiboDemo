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
        newNavBar.items = [newItem]
        return newNavBar
    }
}
