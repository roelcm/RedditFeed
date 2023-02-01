//
//  Dictionary+Extension.swift
//  RedditFeed
//
//  Created by Roel Castano on 1/31/23.
//

import Foundation

/**
Protocol to generate URL query string from Dictionary[String:String].
*/
extension Dictionary where Key: QueryEscapableString, Value: QueryEscapableString {
    /**
    Gets escped string.
    - returns: Returns string by adding percent encoding in UTF-8
    */
    var URLQuery: String {
        get {
            return self.map({"\($0.addPercentEncoding)=\($1.addPercentEncoding)"}).joined(separator: "&")
        }
    }
}
