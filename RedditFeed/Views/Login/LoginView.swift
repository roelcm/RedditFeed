//
//  LoginView.swift
//  RedditFeed
//
//  Created by Roel Castano on 1/31/23.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var vm: LoginViewModel

    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .white], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack(alignment: .center) {
                Spacer()
                Image("AppLogo")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width: 200)
                    .cornerRadius(30)
                Spacer()
                LoginButton {
                    vm.login()
                }
                Spacer()
            }
            .overlay(content: {
                if vm.isLoading {
                    ProgressView()
                }
            })
            .alert("Login Failed", isPresented: $vm.showAlert, actions: {
                Button("OK") {}
            }, message: {
                if let errorMessage = vm.errorMessage {
                    Text(errorMessage)
                }
            })
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(LoginViewModel(session: Session()))
    }
}
