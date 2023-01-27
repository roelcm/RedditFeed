//
//  UFITower.swift
//  RedditFeed
//
//  Created by Roel Castano on 1/26/23.
//

import SwiftUI

struct UFITower: View {
    var body: some View {
        VStack(spacing: 20) {
            UFIButton(buttonVM: UFIButtonViewModel(
                sfImage: "hand.thumbsup.fill",
                subtitle: "123"
            ))
            UFIButton(buttonVM: UFIButtonViewModel(
                sfImage: "text.bubble.fill",
                subtitle: "13"
            ))
            UFIButton(buttonVM: UFIButtonViewModel(
                sfImage: "square.and.arrow.up.circle.fill",
                subtitle: "Share"
            ))
        }
    }
}

struct UFITower_Previews: PreviewProvider {
    static var previews: some View {
        UFITower()
    }
}
