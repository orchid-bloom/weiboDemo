//
//  DTViewController.swift
//  weibo
//
//  Created by tianXin on 2017/2/27.
//  Copyright © 2017年 tianXin. All rights reserved.
//

import UIKit

class DTViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //自定义导航栏
    lazy var customNavigationBar :UINavigationBar = {[weak self] ()->UINavigationBar in
          let navigationBar = self?.createCustomNavigationBar()
          return navigationBar!;
        }()
    //自定义状态栏
    lazy var customStatusBar:UIView = {()-> UIView in
        let bar = UIView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 20))
        return bar
    }()
    ///自定义Head view
    lazy  var customHeadView:UIView = {[weak self] ()-> UIView in
        let customHeadView = self?.createCustomHeadView()
        customHeadView?.addSubview((self?.customStatusBar)!)
        customHeadView?.addSubview((self?.customNavigationBar)!)
        return customHeadView!
        }()
    
    //pragma mark -- styleNavBar
     func styleNavBar (){
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        view.addSubview(self.customHeadView)
    }
     func backTapped (sender:Any) {
//        self.navigationController?.popViewController(animated: true)
    }
     func createCustomNavigationBar ()->(UINavigationBar) {
        let newNavBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: ScreenWidth, height: 44))
        newNavBar.barTintColor = UIColor.white
        newNavBar.shadowImage = nil
        let newItem   = UINavigationItem()
        newItem.title = self.title
        if (self.navigationController?.viewControllers.first != self) {
            newItem.leftBarButtonItems = [self.backNavigationItem()]
        }
        newNavBar.items = [newItem]
        return newNavBar
    }
     func createCustomHeadView()->(UIView) {
        let customHeadView = UIView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 64))
        customHeadView.backgroundColor = UIColor.white
        return customHeadView
    }
     func backNavigationItem()-> (UIBarButtonItem) {
        let navBackImage = UIImage.init(named: "hotweibo_back_icon")
        let navBackImageHighlight = UIImage.init(named: "hotweibo_back_icon_highlighted")
        let button = UIButton(type:.custom)
        button.setTitle("返回", for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: (navBackImage?.size.width)!, height: (navBackImage?.size.height)!)
        button.setImage(navBackImage, for: .normal)
        button.setImage(navBackImageHighlight, for: .highlighted)
        button.addTarget(self, action:#selector(backTapped(sender:)), for:.touchUpInside)
        let barButtonItem = UIBarButtonItem(customView: button)
        return barButtonItem
    }
    ///自定义返回按钮点击事件，子类实现
    func customBackItemClicked() {
        
    }
    ///添加自定义返回按钮
    func addCustomBackBarButtonItem() {
        let backBtn = UIButton(type: .custom)
        backBtn.frame.size = (UIImage.init(named: "hotweibo_back_icon")?.size)!;
        backBtn.setImage(UIImage.init(named: "hotweibo_back_icon"), for: .normal)
        backBtn.addTarget(self, action: #selector(customBackItemClicked), for: .touchUpInside)
        let barButtonItem = UIBarButtonItem(customView: backBtn)
        let negativeSpacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        negativeSpacer.width = -10;
        self.navigationItem.leftBarButtonItems = [negativeSpacer, barButtonItem,];
    }
    ///移除自定义返回按钮
    func removeCustomBackBarButtonItem() {
        self.navigationItem.leftBarButtonItems = nil;
    }
}
