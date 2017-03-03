//
//  DTHomeViewController.swift
//  weibo
//
//  Created by Tema on 17/2/27.
//  Copyright © 2017年 tianXin. All rights reserved.
//

import UIKit

fileprivate let cellID = "cellID"

class DTHomeViewController: DTPaginationViewController {

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
        self.title = "Tome"
    }
    override func loadData() {
        
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
        newItem.leftBarButtonItems = [self.backNavigationItem()]
        newItem.rightBarButtonItems = [self.addCustomRightBarButtonItem()]
        newNavBar.items = [newItem]
        return newNavBar
    }
    override func backNavigationItem()-> (UIBarButtonItem) {
        guard    let navBackImage     = UIImage.init(named: "navigationbar_friendattention"),
            let navBackImageHighlight = UIImage.init(named: "navigationbar_friendattention_highlighted") else {
                return UIBarButtonItem()
        }
        let barButtonItem = UIBarButtonItem.creatBarButtonItem(image: navBackImage, lightImage: navBackImageHighlight, title: nil, target: self, action: #selector(backTapped(sender:)))
        return barButtonItem
    }
    override func addCustomRightBarButtonItem()-> (UIBarButtonItem)  {
        guard    let navBackImage     = UIImage.init(named: "navigationbar_icon_radar"),
            let navBackImageHighlight = UIImage.init(named: "navigationbar_icon_radar_aperture") else {
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
// MARK: - UITableView delegate
extension DTHomeViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
        let vc = DTMicroblogDetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "123")
        if !(cell != nil) {
            cell = UITableViewCell(style: .default, reuseIdentifier: "123")
        }
        cell?.textLabel?.text = String.init(format: "第%d行", indexPath.row)
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
