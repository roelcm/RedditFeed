//
//  String+Extension.swift
//  RedditFeed
//
//  Created by Roel Castano on 1/31/23.
//

import Foundation

private let allowedCharacterSet = CharacterSet(charactersIn: "!$&'()*+,-./0123456789:;=?@ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~")

/**
Protocol to generate URL query string from Dictionary[String:String].
*/
public protocol QueryEscapableString {
    var addPercentEncoding: String { get }
}

extension String: QueryEscapableString {
    /**
    Returns string by adding percent encoding in UTF-8
    Protocol to generate URL query string from Dictionary[String:String].
    */
    public var addPercentEncoding: String {
        get {
            return (self as NSString).addingPercentEncoding(withAllowedCharacters: allowedCharacterSet) ?? self
        }
    }
}
