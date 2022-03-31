//
//  SingleFeedViewWithComments.swift
//  LovelyPet
//
//  Created by Jacob Ko on 2022/03/31.
//

import SwiftUI

struct SingleFeedViewWithComments: View {
	// MARK: -  PROPERTY
	@ObservedObject var posts: PostViewModel = PostViewModel()
	
	// MARK: -  BODY
	var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			LazyVStack {
				ForEach(posts.dataArray, id: \.self) { post in
					PostView(post: post, showHeaderAndFooter: true)
				} //: LOOP
			} //: LAZYVSTACK
		} //: SCROLL
		.navigationTitle("포스트")
		.navigationBarTitleDisplayMode(.inline)
	}
}

// MARK: -  PREVIEW
struct SingleFeedViewWithComments_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			SingleFeedViewWithComments(posts: PostViewModel())
		}
	}
}
