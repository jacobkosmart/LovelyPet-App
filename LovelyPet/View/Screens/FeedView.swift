//
//  FeedView.swift
//  LovelyPet
//
//  Created by Jacob Ko on 2022/03/25.
//

import SwiftUI

struct FeedView: View {
	// MARK: -  PROPERTY
	// @EnvironmentObject private var vm: PostViewModel
	@ObservedObject var posts: PostViewModel = PostViewModel()
	var title: String
	
	// MARK: -  BODY
	var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			LazyVStack {
				ForEach(posts.dataArray, id: \.self) { post in
					PostView(post: post, addHeartAnimationToView: true, showHeaderAndFooter: true, showCommentBtn: true)
				} //: LOOP
			} //: LAZYVSTACK
		} //: SCROLL
		.navigationTitle(title)
		.navigationBarTitleDisplayMode(.inline)
	}
}

// MARK: -  PREVIEW
struct FeedView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			FeedView(posts: PostViewModel(), title: "포스트")
		}
	}
}
