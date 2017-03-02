//
//  DTPushViewController.swift
//  weibo
//
//  Created by Tema on 17/2/27.
//  Copyright © 2017年 tianXin. All rights reserved.
//

import UIKit

class DTPushViewController: DTViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        styleNavBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Push"
    }
    override func styleNavBar (){
        
    }

}
