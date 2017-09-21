//
//  String+Extention.swift
//  weibo
//
//  Created by tianXin on 2017/3/13.
//  Copyright © 2017年 tianXin. All rights reserved.
//

import Foundation

extension String {

    /// Checking if String is Empty
    ///
    /// - Returns: Bool
    func isBlank() -> Bool {
        return self.removeWhiteSpacesFromString() == "" ? true:false
    }
    /// Checking if String is Empty or "(null)"
    ///
    /// - Returns: Bool
    func isValid() -> Bool {
        return (self.removeWhiteSpacesFromString() == "" || self == "(null)") ? false : true
    }
    /// remove white spaces from String
    ///
    /// - Returns: String
    func removeWhiteSpacesFromString() -> String {
     return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    /// Checking if String is empty or nil
    ///
    /// - Parameter string: string
    /// - Returns: Bool
    static func isValid(string:String?)->Bool {
        guard let string = string else {
            return false
        }
        return string.removeWhiteSpacesFromString().isValid()
    }
    
    
    func countNumberOfWords() -> Int {
        let scanner = Scanner.init(string: self)
        let whiteSpace = CharacterSet.whitespaces
        var count = 0
        
        while  scanner.scanCharacters(from: whiteSpace, into: nil){
            count += count
        }
        return count
    }
}
