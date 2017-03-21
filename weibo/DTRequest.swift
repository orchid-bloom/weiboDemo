//
//  DTRequest.swift
//  weibo
//
//  Created by tianXin on 2017/3/4.
//  Copyright © 2017年 tianXin. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

enum DTRequestStatus : Int{
    case success = 200
    case failure = 0
    case unusual = -1
}
/**
 - name      status:状态
 - parameter result:JSON
 - return    msg :提示信息
 */
typealias CompletionHandler = (_ status:DTRequestStatus?,_ msg:String?,_ result:JSON?) -> ()
typealias Response          = (_ result:Any?) -> ()

class DTRequest {

    var accessToken:String?
    /**
     - name  request
     */
    func request(method:HTTPMethod, urlString:String,parameters:[String:Any]?,completionHandler: @escaping CompletionHandler) {
        setNetworkActivityIndicator(true)
        var parameters  = parameters
        if (parameters == nil) {
            parameters = [String:String]()
        }
        parameters!["access_token"] = accessToken
        if method == .get {
            get(urlString: urlString, parameters: parameters, completionHandler: completionHandler)
        }else{
            post(urlString: urlString, parameters: parameters, completionHandler: completionHandler)
        }
    }
    /**
     - name      get请求
     - parameter urlString:URL
     - parameter parameters:参数
     - parameter completionHandler:回调
     - return    JSON
     */
    func get(urlString:String,parameters:[String:Any]?,completionHandler: @escaping CompletionHandler)  {
        Alamofire.request(String.requestUrl(urlString), method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON {(response) in
            self.handle(response: response, completionHandler: completionHandler)
        }
    }
    /**
     - name      get请求
     - parameter urlString:URL
     - parameter parameters:参数
     - parameter completionHandler:回调
     - return    JSON
     */
    func post(urlString:String,parameters:[String:Any]?,completionHandler: @escaping CompletionHandler) {
        Alamofire.request(String.requestUrl(urlString), method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON {(response) in
            self.handle(response: response, completionHandler: completionHandler)
        }
    }
    /**
     - name      JSON返回结果处理
     - parameter response:参数
     - parameter completionHandler:回调
     */
    fileprivate func handle(response:DataResponse<Any> ,completionHandler:@escaping CompletionHandler) {
        setNetworkActivityIndicator(false)
        switch response.result{
        case .success(let value):
            let json = JSON(value)
            completionHandler(.success, nil, json)
        case .failure(let error):
            completionHandler(.failure,error.localizedDescription,nil)
        }
    }
    /**
     - name      活动指示器设置
     - parameter visible:参数
     */
    fileprivate func setNetworkActivityIndicator(_ visible:Bool) {
        if visible {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }else{
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
}

