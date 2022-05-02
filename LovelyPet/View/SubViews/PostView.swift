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
	@State var animateLike: Bool = false
	@State var addHeartAnimationToView: Bool
	var showHeaderAndFooter: Bool
	var showCommentBtn: Bool
	
	// MARK: -  BODY
	var body: some View {
		VStack(alignment: .center, spacing: 0) {
			// MARK: -  HEADER
			if showHeaderAndFooter {
				HStack {
					// Image
					NavigationLink {
						ProfileView(profileDisplayName: post.username, isMyProfile: false, profileUserID: post.userID)
					} label: {
						Image("dog1")
							.resizable()
							.scaledToFill()
							.frame(width: 30, height: 30, alignment: .center)
							.cornerRadius(15)
						
						Text(post.username)
							.font(.callout)
							.fontWeight(.medium)
							.foregroundColor(.primary)
					}
					
					Image(systemName: "ellipsis")
						.font(.headline)
						.hTrailing()
					
				} //: HSTACK
				.padding(6)
			}
			
			// MARK: -  IMAGE
			ZStack {
				Image("dog1")
					.resizable()
					.scaledToFit()
					.cornerRadius(10)
					.padding(.horizontal, 5)
				
				if addHeartAnimationToView {
					LikeAnimationView(animate: $animateLike)
				}
			} //: ZSTACK
			
			// MARK: -  FOOTER
			if showHeaderAndFooter {
				HStack(spacing: 30) {
					
					// Heart Btn
					Button {
						if post.likedByUser {
							// unlike
							unlikePost()
						} else {
							// like
							likePost()
						}
					} label: {
						Image(systemName: post.likedByUser ? "heart.fill" : "heart")
							.font(.title3)
					}
					.accentColor(post.likedByUser ? .red : .primary)
					
					// MARK: -  Comment Icon
					if showCommentBtn {
						NavigationLink {
							CommentsView()
						} label: {
							
							Image(systemName: "bubble.middle.bottom")
								.font(.title3)
								.foregroundColor(.primary)
						}
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
			}
		} //: VSTACK
	}
	
	// MARK: -  FUNCTION
	func likePost() {
		// Update the local data
		let updatedPost = PostModel(postID: post.postID, userID: post.userID, username: post.username, caption: post.caption, dateCreated: post.dateCreated, likeCount: post.likeCount + 1, likedByUser: true)
		self.post = updatedPost
		
		// Wehn you like the post and like will turn to true and the animation will begin which takes 0.7 sec
		animateLike = true
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
			animateLike = false
		}
	}
	func unlikePost() {
		let updatedPost = PostModel(postID: post.postID, userID: post.userID, username: post.username, caption: post.caption, dateCreated: post.dateCreated, likeCount: post.likeCount - 1, likedByUser: false)
		self.post = updatedPost
	}
}

// MARK: -  PREVIEW
struct PostView_Previews: PreviewProvider {
	static var post: PostModel = PostModel( postID: "", userID: "", username: "Jacob", caption: "This is the Test", dateCreated: Date(), likeCount: 0, likedByUser: false)
	static var previews: some View {
		PostView(post: post, addHeartAnimationToView: true, showHeaderAndFooter: true, showCommentBtn: true)
			.previewLayout(.sizeThatFits)
	}
}
