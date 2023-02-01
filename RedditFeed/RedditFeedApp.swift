//
//  RedditFeedApp.swift
//  RedditFeed
//
//  Created by Roel Castano on 1/26/23.
//

import SwiftUI
import OAuthSwift

@main
struct RedditFeedApp: App {
    @StateObject private var session: Session
    private let loginVM: LoginViewModel
    
    init() {
        let session = Session()
        _session = StateObject(wrappedValue: session)
        self.loginVM = LoginViewModel(session: session)
    }

    var body: some Scene {
        WindowGroup {
            if session.isAuthorized {
                HomeView()
                    .background(.black)
                    .environmentObject(session)
            } else {
                LoginView()
                    .environmentObject(loginVM)
                    .onOpenURL { (url) in
                        OAuthSwift.handle(url: url)
                    }
            }
        }
    }
}
