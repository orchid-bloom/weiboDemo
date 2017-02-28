//
//  DTViewController.swift
//  weibo
//
//  Created by tianXin on 2017/2/27.
//  Copyright © 2017年 tianXin. All rights reserved.
//

import UIKit

class DTViewController: UIViewController {


    lazy var customNavigationBar :UINavigationBar = {[weak self] ()->UINavigationBar in
        let newNavBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: ScreenWidth, height: ScreenHeight))
        let newItem   = UINavigationItem()
        newItem.title = self?.title
        let navBackImage = UIImage.init(named: "hotweibo_back_icon")
        let navBackImageHighlight = UIImage.init(named: "hotweibo_back_icon_highlighted")
        let button = UIButton(type:.custom)
        button.frame = CGRect(x: 0, y: 0, width: (navBackImage?.size.width)!, height: (navBackImage?.size.height)!)
        button.setImage(navBackImage, for: .normal)
        button.setImage(navBackImageHighlight, for: .highlighted)
        button.addTarget(self, action:#selector(backTapped(sender:)), for:.touchUpInside)
        let barButtonItem = UIBarButtonItem(customView: button)
        newItem.leftBarButtonItems = [barButtonItem]
        return newNavBar
    }()
   lazy var customStatusBar:UIView = { [weak self] ()-> UIView in
        let bar = UIView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 20))
        return bar
    }()
   lazy  var customHeadView:UIView = {[weak self] ()-> UIView in
        let customHeadView = UIView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 64))
        customHeadView.addSubview((self?.customStatusBar)!)
        customHeadView.addSubview((self?.customNavigationBar)!)
        return customHeadView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //pragma mark -- styleNavBar
     func styleNavBar (){
        
    }
     func backTapped (sender:Any) {
        
    }
     func createCustomNavigationBar ()->(UINavigationBar) {
        return UINavigationBar()
    }
     func createCustomHeadView()->(UIView) {
        return UIView()
    }
     func backNavigationItem()-> (UINavigationItem) {
        return UINavigationItem()
    }
}
