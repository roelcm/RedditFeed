//
//  UFIButton.swift
//  RedditFeed
//
//  Created by Roel Castano on 1/26/23.
//

import SwiftUI

struct UFIButtonViewModel {
    let sfImage: String
    let subtitle: String
    let action: () -> Void
}

struct UFIButton: View {
    let buttonVM: UFIButtonViewModel
    
    var body: some View {
        Button {
            buttonVM.action()
        } label: {
            VStack {
                Image(systemName: buttonVM.sfImage)
                    .resizable()
                    .frame(width: 35, height: 35)
                
                Text(buttonVM.subtitle)
                    .font(.subheadline)
            }
        }
    }
}

struct UFIButton_Previews: PreviewProvider {
    static var previews: some View {
        UFIButton(buttonVM:
                    UFIButtonViewModel(
                        sfImage: "square.and.arrow.up.circle.fill",
                        subtitle: "Share",
                        action: {}
                    )
        )
    }
}
