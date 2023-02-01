//
//  LoginButton.swift
//  RedditFeed
//
//  Created by Roel Castano on 1/31/23.
//

import SwiftUI

struct LoginButton: View {
    let loginAction: () -> Void

    var body: some View {
        Button {
            loginAction()
        } label: {
            Text("Reddit Login")
                .font(.title)
                .bold()
                .foregroundColor(.white)
        }
        .accessibilityIdentifier("loginButton")
        .frame(width: 300, height: 50)
        .background(.black)
        .cornerRadius(20)
        .padding()
    }
}

struct LoginButton_Previews: PreviewProvider {

    static var previews: some View {
        LoginButton() {}
    }
}
