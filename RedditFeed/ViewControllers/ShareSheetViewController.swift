//
//  ShareSheetViewController.swift
//  RedditFeed
//
//  Created by Roel Castano on 1/27/23.
//

import SwiftUI

struct ShareSheetViewController: UIViewControllerRepresentable {
    var itemsToShare: [Any]

    func makeUIViewController(context: UIViewControllerRepresentableContext<ShareSheetViewController>) -> UIActivityViewController {
        let controller = UIActivityViewController(
            activityItems: itemsToShare,
            applicationActivities: nil
        )
        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController,
                                context: UIViewControllerRepresentableContext<ShareSheetViewController>) {
        // no-op
    }
}
