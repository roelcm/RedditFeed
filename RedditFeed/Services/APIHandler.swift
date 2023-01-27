//
//  APIHandler.swift
//  RedditFeed
//
//  Created by Roel Castano on 1/26/23.
//

import Foundation

class APIHandler {
    func fetchData(url: URL) async throws -> Data {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard
            let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200
        else {
            throw APIError.invalidResponseStatus
        }
        
        return data
    }
}
