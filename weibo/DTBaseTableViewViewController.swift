//
//  DTBaseTableViewViewController.swift
//  weibo
//
//  Created by Tema on 17/2/27.
//  Copyright © 2017年 tianXin. All rights reserved.
//

import UIKit

class DTBaseTableViewViewController: DTViewController ,UITableViewDelegate ,UITableViewDataSource{

    var tableView : UITableView?
    var dataList  = [Any]()
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func setTableView() {
        tableView = UITableView(frame: CGRect(x: 0, y: CustomHeaderHeight, width: ScreenWidth, height: ScreenHeight - CustomHeaderHeight))
        tableView?.delegate = self
        tableView?.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return dataList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "")
        if !(cell != nil) {
            cell = UITableViewCell()
        }
        return cell!
    }

}
