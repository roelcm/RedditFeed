//
//  CommentRow.swift
//  RedditFeed
//
//  Created by Roel Castano on 1/31/23.
//

import SwiftUI

struct CommentRow: View {
    @EnvironmentObject var session: Session
    let comment: Comment
    @State var liked = false

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(comment.author)
                    .font(.subheadline)
                    .bold()
                Text(comment.body)
            }

            Spacer()

            Button {
                session.vote(.comment, liked ? .up : .none, name: comment.id) { result in
                    switch result {
                    case .success(_):
                        liked.toggle()
                    case .failure(let error):
                        //TODO: Handle Error
                        print(error)
                    }
                }
            } label: {
                VStack {
                    Image(systemName: liked ? "hand.thumbsup.fill" : "hand.thumbsup")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
            }
        }
        .foregroundColor(.black)
    }
}

struct CommentRow_Previews: PreviewProvider {
    static var previews: some View {
        CommentRow(comment: Comment.mockComment)
    }
}
