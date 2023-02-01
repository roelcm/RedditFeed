//
//  ListingViewService.swift
//  RedditFeed
//
//  Created by Roel Castano on 1/26/23.
//

import Foundation

protocol ListingViewServiceProtocol {
    func fetchRequest<T: Decodable>(url: URL) async throws -> T
}

struct ListingViewService: ListingViewServiceProtocol {
    let apiHandler: APIHandler
    let responseHandler: ResponseHandler

    init(apiHandler: APIHandler = APIHandler(),
         responseHandler: ResponseHandler = ResponseHandler()) {
        self.apiHandler = apiHandler
        self.responseHandler = responseHandler
    }
    
    func fetchRequest<T: Decodable>(url: URL) async throws -> T {
        do {
            let data = try await self.apiHandler.fetchData(url: url)
            return try self.responseHandler.fetchModel(data: data)
        } catch {
            throw APIError.dataTaskError(error.localizedDescription)
        }
    }
}

struct ListingViewServiceTester: ListingViewServiceProtocol {
    let apiHandler: APIHandler
    let responseHandler: ResponseHandler

    init(apiHandler: APIHandler = APIHandler(),
         responseHandler: ResponseHandler = ResponseHandler()) {
        self.apiHandler = apiHandler
        self.responseHandler = responseHandler
    }
    
    func fetchRequest<T: Decodable>(url: URL) async throws -> T {
        if (T.self == Optional<SubredditListing>.self) {
            return SubredditListing.mockListing as! T

        } else if (T.self == Optional<PostListing>.self) {
            return PostListing.mockListing as! T
        }
        
        throw APIError.dataTaskError("mock error")
    }
}
