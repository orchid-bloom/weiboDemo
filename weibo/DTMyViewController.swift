//
//  DTMyViewController.swift
//  weibo
//
//  Created by Tema on 17/2/27.
//  Copyright © 2017年 tianXin. All rights reserved.
//

import UIKit

class DTMyViewController: DTViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        styleNavBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func styleNavBar (){
        self.title = "Me"
        view.addSubview(self.customHeadView)
    }

}
