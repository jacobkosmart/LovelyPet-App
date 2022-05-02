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
	@State var postImage: UIImage = UIImage(named: "dog1")!
	var showHeaderAndFooter: Bool
	var showCommentBtn: Bool
	
	
	// ActionSheet variables
	@State var showActionSheet: Bool = false
	@State var actionSheetType: PostActionSheetOption = .general
	enum PostActionSheetOption {
		case general
		case reporting
	}
	
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
					
					// share and report Btn
					Button {
						showActionSheet.toggle()
					} label: {
						Image(systemName: "ellipsis")
							.font(.headline)
							.hTrailing()
					}
					.actionSheet(isPresented: $showActionSheet) {
						getAcrtionSheet()
					}
					.accentColor(.primary)
					
				} //: HSTACK
				.padding(6)
			}
			
			// MARK: -  IMAGE
			ZStack {
				Image(uiImage: postImage)
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
					
					// Comment Icon
					if showCommentBtn {
						NavigationLink {
							CommentsView()
						} label: {
							
							Image(systemName: "bubble.middle.bottom")
								.font(.title3)
								.foregroundColor(.primary)
						}
					}
					
					// Share Btn
					Button {
						sharePost()
					} label: {
						Image (systemName: "paperplane")
							.font(.title3)
					}
					.accentColor(.primary)

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
	
	func getAcrtionSheet() -> ActionSheet {
		switch self.actionSheetType {
		case .general:
			return ActionSheet(title: Text("리포트 및 공유"), message: nil, buttons: [
				.destructive(Text("리포트"), action: {
					self.actionSheetType = .reporting
					DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
						self.showActionSheet.toggle()
					}
				}),
				.default(Text("공유"), action: {
					sharePost()
				}),
				.cancel()
			])
		case .reporting:
			return ActionSheet(title: Text("포스트 신고하기"), message: nil, buttons: [
				.destructive(Text("이 게시물은 부적절한 포스트입니다"), action: {
					reportPost(reason: "This is inappropriate post")
				}),
				.destructive(Text("이 게시물은 스펨성 광고 포스트 입니다"), action: {
						reportPost(reason: "This is spam")
					}),
				.destructive(Text("이 게시물은 선정성 있는 포스트입니다"), action: {
					reportPost(reason: "This is sexual post")
				}),
				.cancel({
					self.actionSheetType = .general
				})
			])
		}
	}
	
	func reportPost(reason: String) {
		print("Report Post Now")
	}
	
	func sharePost() {
		let message = "Check out this post on Lovely Pet"
		let image = postImage
		let link = URL(string: "https://www.jacobko.info")!
		
		let activityViewController = UIActivityViewController(activityItems: [message, image, link], applicationActivities: nil)
		
		let viewController = UIApplication.shared.windows.first?.rootViewController
		viewController?.present(activityViewController, animated: true, completion: nil)
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
