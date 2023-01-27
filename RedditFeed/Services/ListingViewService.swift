//
//  ListingViewService.swift
//  RedditFeed
//
//  Created by Roel Castano on 1/26/23.
//

import Foundation

struct ListingViewService {
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
