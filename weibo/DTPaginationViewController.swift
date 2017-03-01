//
//  DTPaginationViewController.swift
//  weibo
//
//  Created by tianXin on 2017/2/28.
//  Copyright © 2017年 tianXin. All rights reserved.
//

import UIKit
import MJRefresh

enum RefreshType {
    case  HeaderRefresh
    case  FooterRefresh
}

class DTPaginationViewController: DTViewController {

    lazy var refreshTableView = UITableView()
    lazy var dataList         = [Any]()
    lazy var page             = DTPage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    //添加下拉刷新
    func addHeadRefresh() {
        let headRefresh = MJRefreshHeader(refreshingTarget: self, refreshingAction: #selector(headerRefreshing(sender:)))
        refreshTableView.mj_header = headRefresh
    }
    //添加上托加载更多
    func addFooterRefresh() {
        let footRefresh = MJRefreshFooter(refreshingTarget: self, refreshingAction: #selector(footRefreshing(sender:)))
        refreshTableView.mj_footer = footRefresh
    }
    //刷新
    func headerRefreshing(sender :Any) {
        beforeStartRefresh()
        page.pageIndex = 1
        requestWithPageIndex(pageIndex: page.pageIndex, refreshType: .HeaderRefresh)
    }
    //加载更多
    func footRefreshing(sender :Any) {
        beforeStartRefresh()
        requestWithPageIndex(pageIndex: page.pageIndex, refreshType: .FooterRefresh)
    }
    //结束刷新
    func endRefreshingWithType(refreshType:RefreshType)  {
        
    }
    //子类需要重写这个方法
    func requestWithPageIndex(pageIndex:Int,refreshType:RefreshType) {
        loadWithPage(pageIndex: pageIndex, requestType: refreshType)
    }
    /**
     *  加载分页, 该方法需要子类重写，此方法废弃。使用requestWithPageIndex
     *
     *  @param pageIndex 当前分页索引
     *  @param requestType 请求类型
     */
    func loadWithPage(pageIndex:Int,requestType:RefreshType) {
        
    }
    /**
     *  添加数据前调用，处理下拉和加载更多的结束后的动作
     *
     *  @param refreshType 刷新类型
     *  @param myDataList  添加数据
     */
    func addDataBeforeWithRefreshType(refreshType:RefreshType,dataArray:[Any])  {
        if refreshType == .HeaderRefresh  {
            dataList.removeAll()
            if dataArray.count > page.pageSize {
                page.addPageIndex()
                addFooterRefresh()
            }else{
                refreshTableView.mj_footer = nil
            }
        }else{
            page.addPageIndex()
            if dataArray.count < page.pageSize {
                refreshTableView.mj_footer = nil
            }
        }
    }
    func beforeStartRefresh() {
    
    }
}
