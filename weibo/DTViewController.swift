//
//  DTViewController.swift
//  weibo
//
//  Created by tianXin on 2017/2/27.
//  Copyright © 2017年 tianXin. All rights reserved.
//

import UIKit

class DTViewController: UIViewController {

    /*
     
     UINavigationBar *newNavBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, self.customStatusBar?self.customStatusBar.height:0, ScreenWidth, 44)];
     
     UINavigationItem *newItem = [[UINavigationItem alloc] init];
     newItem.title = self.title;
     if (self.navigationController.viewControllers.firstObject != self) {
     newItem.leftBarButtonItems = @[[self backNavigationItem]] ;
     }
     [newNavBar setItems:@[newItem]];
     */
    lazy var customNavigationBar: UINavigationBar = {[weak self] in
        let newNavBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: ScreenWidth, height: ScreenHeight))
        let newItem   = UINavigationItem()
        newItem.title = self?.title
        
        return newNavBar
    }()
    lazy var customStatusBar: UIView = {
        let bar = UIView()
        return bar
    }()
    lazy var customHeadView: UIView = {
        let view = UIView()
        return view
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    
    
    //pragma mark -- styleNavBar
    fileprivate func styleNavBar (){
        
    }
    fileprivate func backTapped (sender:Any) {
        
    }
    fileprivate func createCustomNavigationBar ()->(UINavigationBar) {
        return UINavigationBar()
    }
    fileprivate func createCustomHeadView()->(UIView) {
        return UIView()
    }
    fileprivate func backNavigationItem()-> (UINavigationItem) {
        return UINavigationItem()
    }
}
