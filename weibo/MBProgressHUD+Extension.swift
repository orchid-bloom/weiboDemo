//
//  MBProgressHUD+Extension.swift
//  weibo
//
//  Created by tianXin on 2017/2/28.
//  Copyright © 2017年 tianXin. All rights reserved.
//

import Foundation
import MBProgressHUD

extension MBProgressHUD {
  class  public func showToastWithString( _ string:String)->() {
    let window = UIApplication.shared.windows.last
    let hud = MBProgressHUD.showAdded(to: window, animated: true)
    hud?.mode = .text;
    hud?.detailsLabelFont = UIFont.systemFont(ofSize: 16)
    hud?.detailsLabelColor = UIColor.white
    hud?.detailsLabelText = string;
    hud?.margin = 10;
    hud?.removeFromSuperViewOnHide = true;
    hud?.show(animated: true, whileExecuting: { 
        sleep(2)
    }, completionBlock: { 
        hud?.removeFromSuperview()
    })
    }
}
