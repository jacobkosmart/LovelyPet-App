//
//  ImageGridView.swift
//  LovelyPet
//
//  Created by Jacob Ko on 2022/03/31.
//

import SwiftUI

struct ImageGridView: View {
	// MARK: -  PROPERTY
	@EnvironmentObject private var vm: PostViewModel
	
	// MARK: -  BODY
	var body: some View {
		LazyVGrid(
			columns: [
				GridItem(.flexible()),
				GridItem(.flexible()),
				GridItem(.flexible())
			],
			alignment: .center,
			spacing: nil,
			pinnedViews: []) {
				ForEach(vm.dataArray, id: \.self) { post in
					NavigationLink(destination: FeedViewWithComments(posts: PostViewModel(post: post), title: "포스트")) {
						PostView(post: post, addHeartAnimationToView: false, showHeaderAndFooter: false, showCommentBtn: false)
					}
				} //: LOOP
			}
	}
}

// MARK: -  PREVIEW
struct ImageGridView_Previews: PreviewProvider {
	static var previews: some View {
		ImageGridView()
			.environmentObject(PostViewModel())
			.previewLayout(.sizeThatFits)
	}
}
