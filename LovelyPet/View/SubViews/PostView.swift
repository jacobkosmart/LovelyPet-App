//
//  PostView.swift
//  LovelyPet
//
//  Created by Jacob Ko on 2022/03/25.
//

import SwiftUI

struct PostView: View {
	// MARK: -  PROPERTY
	@State var post: PostModel
	
	// MARK: -  BODY
	var body: some View {
		VStack(alignment: .center, spacing: 0) {
			// MARK: -  HEADER
			HStack {
				// Image
				Image("dog1")
					.resizable()
					.scaledToFill()
					.frame(width: 30, height: 30, alignment: .center)
				.cornerRadius(15)
				
				Text(post.username)
					.font(.callout)
					.fontWeight(.medium)
					.foregroundColor(.primary)
				
				Image(systemName: "ellipsis")
					.font(.headline)
					.hTrailing()
				
			} //: HSTACK
			.padding(6)
			
			// MARK: -  IMAGE
			Image("dog1")
				.resizable()
				.scaledToFit()
				.cornerRadius(10)
				.padding(.horizontal, 10)
			
			// MARK: -  FOOTER
			HStack(spacing: 30) {
				Image(systemName: "heart")
					.font(.title3)
				
				// MARK: -  Comment Icon
				NavigationLink {
					CommentsView()
				} label: {
					
					Image(systemName: "bubble.middle.bottom")
						.font(.title3)
						.foregroundColor(.primary)
				}
				
				Image (systemName: "paperplane")
					.font(.title3)
			} //: HSTACK
			.hLeading()
			.padding(10)
			
			// caption type 이 optional 이니까 값이 있는 상태에서만 값에 등록 시킴
			if let caption = post.caption {
				HStack {
					Text(caption)
				} //: HSTACK
				.hLeading()
				.padding(10)
			}
		} //: VSTACK
	}
}

// MARK: -  PREVIEW
struct PostView_Previews: PreviewProvider {
	static var post: PostModel = PostModel( postID: "", userID: "", username: "Jacob", caption: "This is the Test", dateCreated: Date(), likeCount: 0, likedByUser: false)
	static var previews: some View {
		PostView(post: post)
			.previewLayout(.sizeThatFits)
	}
}
