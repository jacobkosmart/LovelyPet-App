//
//  FeedView.swift
//  LovelyPet
//
//  Created by Jacob Ko on 2022/03/25.
//

import SwiftUI

struct FeedView: View {
	// MARK: -  PROPERTY
	@EnvironmentObject private var vm: PostViewModel
	// MARK: -  BODY
	var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			LazyVStack {
				ForEach(vm.dataArray, id: \.self) {
					PostView(post: $0)
				} //: LOOP
			} //: LAZYVSTACK
		} //: SCROLL
		.navigationTitle("포스트")
		.navigationBarTitleDisplayMode(.inline)
	}
}

// MARK: -  PREVIEW
struct FeedView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			FeedView()
				.environmentObject(PostViewModel())
		}
	}
}
