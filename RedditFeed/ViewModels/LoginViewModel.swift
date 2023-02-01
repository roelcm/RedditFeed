//
//  LoginViewModel.swift
//  RedditFeed
//
//  Created by Roel Castano on 1/31/23.
//

import Foundation
import OAuthSwift

class LoginViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var showAlert = false
    @Published var errorMessage: String?
    var session: Session
    
    init(session: Session) {
        self.session = session
    }
    
    let oauthswift = OAuth2Swift(
        consumerKey: "uRY0PuKakwxtM8N7ZGvShw",
        consumerSecret: "rfvszdrgvret",
        authorizeUrl:   "https://ssl.reddit.com/api/v1/authorize.compact",
        accessTokenUrl: "https://ssl.reddit.com/api/v1/access_token",
        responseType:   "token"
    )

    func login() {
        isLoading.toggle()
        defer {
            isLoading.toggle()
        }

        guard let rwURL = URL(string: "picfeed://response") else { return }
        oauthswift.accessTokenBasicAuthentification = true
        let state = generateState(withLength: 20)

        _ = oauthswift.authorize(
            withCallbackURL: rwURL,
            scope: "identity read vote",
            state: state) { result in
                switch result {
                case .success(let (credential, _, _)):
                    self.session.saveSession(session: credential.oauthToken)
                case .failure(let error):
                    self.showAlert = true
                    self.errorMessage = error.localizedDescription + "\nPlease contant the developer and provide this error and the steps to reproduce"
            }
        }

    }
}
