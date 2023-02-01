//
//  HomeOverlay.swift
//  RedditFeed
//
//  Created by Roel Castano on 1/31/23.
//

import SwiftUI

struct HomeOverlay: View {
    @EnvironmentObject var session: Session
    @Binding var selectedSubreddit: String
    @Binding var hiddingOverlay: Bool

    let subreddits = ["memes", "photographs", "CoolPics", "CozyPlaces"]

    var body: some View {
        VStack {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                    
                    Picker("Subreddit", selection: $selectedSubreddit) {
                        ForEach(subreddits, id: \.self) {
                            Text($0)
                        }
                    }
                    .frame(width: 150, height: 35, alignment: .center)
                    .layoutPriority(1)
                    .pickerStyle(MenuPickerStyle())
                    .clipped()
                }

                Spacer()
                
                Button {
                    withAnimation {
                        hiddingOverlay.toggle()
                    }
                } label: {
                    Image(systemName: hiddingOverlay ? "eye.slash.fill" : "eye.fill")
                        .resizable()
                        .frame(width: 30, height: 20)
                    
                }
                .padding(.trailing)

            
                Button {
                    session.logOut()
                } label: {
                    Text("Logout")
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            .foregroundColor(.white)
            .background(.black)
            Spacer()
        }

    }
}


struct HomeOverlay_Previews: PreviewProvider {
    static var previews: some View {
        HomeOverlay(selectedSubreddit: .constant("memes"), hiddingOverlay: .constant(false))
            .environmentObject(Session())
    }
}
