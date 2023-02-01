//
//  Session.swift
//  RedditFeed
//
//  Created by Roel Castano on 1/31/23.
//

import Foundation

/// The type of voting direction.
public enum VoteDirection: Int {
    case up     =  1
    case none   =  0
    case down   = -1
}

/// The type of reddit content.
public enum ContentType: String {
    case post       =  "t3"
    case comment    =  "t1"
}

final class Session: ObservableObject {
    var userToken: String?
    @Published var isAuthorized: Bool = false
    
    func saveSession(session: String) {
        isAuthorized = true
        userToken = session
    }
    
    func logOut() {
        userToken = nil
        isAuthorized = false
    }
    
    func vote(_ contentType: ContentType, _ direction: VoteDirection, name: String, completion: @escaping (Result<Void, Error>) -> Void) -> Void{
        let type = String(contentType.rawValue)
        print(type)
        let parameter = [
            "dir": String(direction.rawValue),
            "id": type + "_" + name
        ]
        let voteURL = RedditAPI.voteURL()
        print(voteURL)
        guard let URL = URL(string: voteURL) else { return }
        var request = URLRequest(url: URL)
        request.setValue("Bearer " + userToken!, forHTTPHeaderField: "authorization")
        let data = parameter.URLQuery.data(using: .utf8)
        request.httpBody = data
        request.httpMethod = "POST"

        let urlSession = URLSession(configuration: URLSessionConfiguration.default)
        let task = urlSession.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            guard
                let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200
            else {
                completion(.failure(APIError.invalidResponseStatus))
                return
            }
            
            guard
                error == nil
            else {
                completion(.failure(APIError.dataTaskError(error!.localizedDescription)))
                return
            }
            
            completion(.success(Void()))
        })
        task.resume()
    }

}
