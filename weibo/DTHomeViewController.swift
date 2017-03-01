//
//  DTHomeViewController.swift
//  weibo
//
//  Created by Tema on 17/2/27.
//  Copyright © 2017年 tianXin. All rights reserved.
//

import UIKit

class DTHomeViewController: DTPaginationViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        styleNavBar()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tome"
    }
    override func styleNavBar (){
        super.styleNavBar()
    }
    
    // MARK: - override
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
        guard    let navBackImage          = UIImage.init(named: "navigationbar_friendattention"),
                 let navBackImageHighlight = UIImage.init(named: "navigationbar_friendattention_highlighted") else {
            return UIBarButtonItem()
        }
        let barButtonItem = UIBarButtonItem.creatBarButtonItem(image: navBackImage, lightImage: navBackImageHighlight, title: nil, target: self, action: #selector(backTapped(sender:)))
        return barButtonItem
    }
    override func addCustomRightBarButtonItem()-> (UIBarButtonItem)  {
        guard    let navBackImage          = UIImage.init(named: "navigationbar_icon_radar"),
                 let navBackImageHighlight = UIImage.init(named: "navigationbar_icon_radar_highlighted") else {
                return UIBarButtonItem()
        }
        let barButtonItem = UIBarButtonItem.creatBarButtonItem(image: navBackImage, lightImage: navBackImageHighlight, title: nil, target: self, action: #selector(customItemClicked))
        return barButtonItem
    }
    override func backTapped (sender:Any) {
        
    }
    override func customItemClicked() {
        
    }
}
