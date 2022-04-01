//
//  PostViewModel.swift
//  LovelyPet
//
//  Created by Jacob Ko on 2022/03/26.
//

import Foundation
import SwiftUI
import UIKit

class PostViewModel: ObservableObject {
	// MARK: -  PROPERTY
	@Published var post: PostModel = PostModel(postID: "", userID: "", username: "Jacob", caption: "This is a test caption", dateCreated: Date(), likeCount: 0, likedByUser: false)
	
	@Published var dataArray = [PostModel]()
	
	// CommentView
	@Published var submissionText: String = ""
	@Published var commentArray = [CommentModel]()
	
	// CaouseView
	@Published var selection: Int = 1
	@Published var timerAdded: Bool = false
	var maxCount: Int = 8
	
	// UploadView
	@Published var showImagePicker: Bool = false
	@Published var imageSelected: UIImage = UIImage(named: "logo")!
	@Published var sourceType: UIImagePickerController.SourceType = .camera
	@Published var showPostImageView: Bool = false
	
	
	// PostImageView
	@Published var captionText: String = ""
	
	// MARK: -  INIT
	init() {
		print("Fetch from DB here")
		let post1 = PostModel(postID: "", userID: "", username: "Emma", caption: "This is a caption", dateCreated: Date(), likeCount: 0, likedByUser: false)
		let post2 = PostModel(postID: "", userID: "", username: "Jessica", caption: nil, dateCreated: Date(), likeCount: 0, likedByUser: false)
		let post3 = PostModel(postID: "", userID: "", username: "Emily", caption: "This is a caption", dateCreated: Date(), likeCount: 0, likedByUser: false)
		let post4 = PostModel(postID: "", userID: "", username: "Chris", caption: nil, dateCreated: Date(), likeCount: 0, likedByUser: false)
		let post5 = PostModel(postID: "", userID: "", username: "John", caption: "This is a caption", dateCreated: Date(), likeCount: 0, likedByUser: false)
		
		self.dataArray.append(contentsOf: [post1, post2, post3, post4, post5])
	}
	
	/// Use for single post selection
	init(post: PostModel) {
		self.dataArray.append(post)
	}
	// MARK: -  FUNCTION
	
	func getComments() {
		print("Get comments from DB")
		
		let comment1 = CommentModel(commentID: "", userID: "", username: "Emma", content: "This is the first comment", dateCreated: Date())
		let comment2 = CommentModel(commentID: "", userID: "", username: "Alex", content: "This is the second comment", dateCreated: Date())
		let comment3 = CommentModel(commentID: "", userID: "", username: "Stefanie", content: "This is the third comment", dateCreated: Date())
		let comment4 = CommentModel(commentID: "", userID: "", username: "Christ", content: "This is the fourth comment", dateCreated: Date())
		
		self.commentArray.append(contentsOf: [comment1, comment2, comment3, comment4])
	}
	
	// CaouseView - automatic scroll photo
	func addTimer() {
		// 중복 방지를 위해서 true 값으로 바꿔 줌
		self.timerAdded = true
		let timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { timer in
			if self.selection == (self.maxCount - 1) {
				self.selection = 1
			} else {
				self.selection += 1
			}
		}
		timer.fire()
	}
	
	// segueToPostImageView : on Dismiss set up segway to post image view
	func segueToPostImageView() {
		// 0.5 sec delay
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
			self.showPostImageView.toggle()
		}
	}
	
	// PostImageView : Post picture to the DB
	func postPicture() {
		print("Post Picture To DB Here")
	}
}
