//
//  DTHomeTableHeadView.swift
//  weibo
//
//  Created by tianXin on 2017/3/20.
//  Copyright © 2017年 tianXin. All rights reserved.
//

import UIKit
import Kingfisher

class DTHomeTableHeadView: UIView,UIScrollViewDelegate{

    lazy var scrollView :UIScrollView = {()->UIScrollView in
        let scroll = UIScrollView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 120))
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
        scroll.bounces = false
        scroll.isPagingEnabled = true
        return scroll
    }()
    var timer :Timer?
    var index = CGFloat(0)
    var dataArray :[DTHomeModel]? {
        didSet {
            guard  let first = dataArray?.first,
            let last  = dataArray?.last else {
            return
            }
            dataArray?.append(first)
            dataArray?.insert(last, at: 0)
            loadUI()
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(scrollView)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    fileprivate func addTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(timerClick(sender:)), userInfo: nil, repeats: true)
    }
    @objc fileprivate func timerClick(sender:Any) {
        scrollView.setContentOffset(CGPoint(x: (scrollView.contentOffset.x)+ScreenWidth, y: 0), animated: true)
    }
    fileprivate func loadUI() {
        guard let dataArray = dataArray else {
            return;
        }
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: ScreenWidth * CGFloat(dataArray.count), height: 120)
        var i = CGFloat(0.0)
        for model in dataArray {
            guard let mo = model.titlepic, let url = URL(string: mo) else {
                i += 1
                return
            }
            let imageView = UIImageView(frame: CGRect(x: i * ScreenWidth, y: 0, width: ScreenWidth, height: 120))
                imageView.kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: nil, completionHandler: { (image, _, _, _) in
                    
                })
            i += 1
            scrollView.addSubview(imageView)
        }
        scrollView.contentOffset = CGPoint(x: 0, y: 0)
        addTimer()
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        timer?.invalidate()
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        addTimer()
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        changeScrollView(scrollView: scrollView)
    }
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        changeScrollView(scrollView: scrollView)
    }
    fileprivate func changeScrollView(scrollView:UIScrollView) {
        if ((dataArray?.count)! >= 3) {
            var curPage = scrollView.contentOffset.x / self.width;
            if (curPage < 1){                                                     //第一张(3_0_1)， 回到最后一张(3_0_1)，
                curPage = CGFloat((dataArray?.count)!) - CGFloat(2);
            }else if (curPage > CGFloat((dataArray?.count)!) - CGFloat(2)) {      // 最后一张(3_0_1)，回到第一张(3_0_1)
                curPage = 1;
            }
            scrollView.contentOffset = CGPoint(x: self.width*curPage, y: 0);
        }
    }
}
