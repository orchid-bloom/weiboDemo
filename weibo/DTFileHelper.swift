//
//  DTFileHelper.swift
//  weibo
//
//  Created by tianXin on 2017/6/28.
//  Copyright © 2017年 tianXin. All rights reserved.
//

import Foundation


class DTFileHelper: NSObject {
    
    
    static func libraryDirectory()->String? {
        return NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).last
    }
    
    static func documentDirectory()->String? {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last
    }
    
    static func preferencePanesDirectory()->String? {
        return NSSearchPathForDirectoriesInDomains(.preferencePanesDirectory, .userDomainMask, true).last
    }
    
    static func cachesDirectory()->String? {
        return NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).last
    }
    
    
    /// Traverse the folder to get the folder size and how much M to return
    /// - Parameter folderPath: folderPath
    /// - Returns:size M
    static func folderSizeAtPath(folderPath:String) -> Double? {
        let fileMager:FileManager = FileManager.default
        
        guard !fileMager.fileExists(atPath: folderPath) else {
            return nil
        }
      
        let childFilesEnumerator = fileMager.enumerator(atPath: folderPath)
        var fileName  :String?
        var folderSize:Double = 0
       
        repeat {
            fileName = childFilesEnumerator?.nextObject() as? String
            if let fileName = fileName {
                let fileAbsolutePath = folderPath.appending(fileName)
                let size    = DTFileHelper.folderSizeAtPath(folderPath: fileAbsolutePath)!
                folderSize  += size
            }
        }while(fileName != nil)
        return folderSize
    }
  
    /// size Of Caches
    /// - Returns: size
    static func sizeOfCachesDirectory()->Double? {
        let queue          = DispatchQueue(label: "com.tema.clearCache");
        var size:Double?
        queue.sync {
            guard let path = DTFileHelper.cachesDirectory() else {
                return
            }
            size           = DTFileHelper.folderSizeAtPath(folderPath: path)
        }
        return size
    }
    
    ///clearCache
    static func clearCache() {
        
        guard let path = DTFileHelper.cachesDirectory() ,let files = FileManager.default.subpaths(atPath: path) else {
            return
        }
        for p in files {
            if !(FileManager.default.fileExists(atPath: p)) {
                try?FileManager.default.removeItem(atPath: p)
            }
        }
    }
}

extension String {
    
    var libraryDirectory :String? {
        return NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).last
    }
    var documentDirectory:String? {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last
    }
    var preferencePanesDirectory:String? {
        return NSSearchPathForDirectoriesInDomains(.preferencePanesDirectory, .userDomainMask, true).last
    }
    var cachesDirectory:String? {
        return NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).last
    }
}
