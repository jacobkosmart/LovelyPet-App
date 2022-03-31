//
//  BrowseView.swift
//  LovelyPet
//
//  Created by Jacob Ko on 2022/03/29.
//

import SwiftUI

struct BrowseView: View {
	// MARK: -  PROPERTY
	@EnvironmentObject private var vm: PostViewModel
	// MARK: -  BODY
	var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			CarouseView()
			ImageGridView()
		} //: SCROLL
		.navigationBarTitle("둘러보기")
		.navigationBarTitleDisplayMode(.inline)
	}
}

// MARK: -  PREVIEW
struct BrowseView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			BrowseView()
				.environmentObject(PostViewModel())
		}
	}
}
