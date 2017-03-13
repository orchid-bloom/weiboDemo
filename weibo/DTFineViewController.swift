//
//  DTFineViewController.swift
//  weibo
//
//  Created by Tema on 17/2/27.
//  Copyright © 2017年 tianXin. All rights reserved.
//

import UIKit

class DTFineViewController: DTViewController {

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
        self.title = "Fine"
    }
    override func styleNavBar (){
        super.styleNavBar()
    }
    override func createCustomNavigationBar ()->(UINavigationBar) {
        let newNavBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: ScreenWidth, height: 44))
        newNavBar.barTintColor = UIColor.white
        let newItem   = UINavigationItem()
        
        let btn = UIButton.creatButton(frame: CGRect(x: 10, y: 5, width: ScreenWidth - 20, height: 25), title: "大家正在搜", titleColor:UIColor(hexString: "#939393") , lightTitleColor: UIColor(hexString: "#939393"), image: UIImage.init(named: "message_choosecontact_search"), lightImage: UIImage.init(named: "message_choosecontact_search"), target: self, action: #selector(navigationSearchClick(sender:)))
        btn.backgroundColor = UIColor(hexString: "#E3E4E6")
        btn.titleLabel?.font = DTFont.getFontWithFontType(.DTFontTypeE)
        btn.layer.cornerRadius = 4;
        newItem.titleView = btn
        newNavBar.items = [newItem]
        return newNavBar
    }
    func navigationSearchClick(sender:Any) {
        
    }
}
