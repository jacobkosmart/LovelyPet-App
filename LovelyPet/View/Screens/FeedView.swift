//
//  FeedView.swift
//  LovelyPet
//
//  Created by Jacob Ko on 2022/03/25.
//

import SwiftUI

struct FeedView: View {
	// MARK: -  PROPERTY
	
	// MARK: -  BODY
	var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			PostView()
			PostView()
			PostView()
			PostView()
			PostView()
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
		}
	}
}
