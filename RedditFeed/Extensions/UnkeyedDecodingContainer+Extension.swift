//
//  UnkeyedDecodingContainer+Extension.swift
//  RedditFeed
//
//  Created by Roel Castano on 1/31/23.
//

import Foundation

struct Empty: Decodable { }

extension UnkeyedDecodingContainer {
  public mutating func skip() throws {
    _ = try decode(Empty.self)
  }
}
