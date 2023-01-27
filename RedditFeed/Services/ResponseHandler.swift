//
//  NetworkManager.swift
//  RedditFeed
//
//  Created by Roel Castano on 1/26/23.
//

import Foundation

class ResponseHandler {
    func fetchModel<T: Decodable>(data: Data,
                                  dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
                                  keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) throws -> T {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = dateDecodingStrategy
        decoder.keyDecodingStrategy = keyDecodingStrategy
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw APIError.decodingError(error.localizedDescription)
        }
    }
}
