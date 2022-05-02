//
//  FeedViewWithComments.swift
//  LovelyPet
//
//  Created by Jacob Ko on 2022/03/31.
//

import SwiftUI

struct FeedViewWithComments: View {
	// MARK: -  PROPERTY
	@ObservedObject var posts: PostViewModel = PostViewModel()
	var title: String
	
	// MARK: -  BODY
	var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			LazyVStack {
				ForEach(posts.dataArray, id: \.self) { post in
					PostView(post: post, addHeartAnimationToView: false, showHeaderAndFooter: true, showCommentBtn: false)
				} //: LOOP
				CommentsView()
			} //: LAZYVSTACK
		} //: SCROLL
		.navigationTitle(title)
		.navigationBarTitleDisplayMode(.inline)
	}
}

// MARK: -  PREVIEW
struct FeedViewWithComments_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			FeedViewWithComments(posts: PostViewModel(), title: "Test")
		}
	}
}



