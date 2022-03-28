//
//  PostViewModel.swift
//  LovelyPet
//
//  Created by Jacob Ko on 2022/03/26.
//

import Foundation
import SwiftUI

class PostViewModel: ObservableObject {
	// MARK: -  PROPERTY
	@Published var post: PostModel = PostModel(postID: "", userID: "", username: "Jacob", caption: "This is a test caption", dateCreated: Date(), likeCount: 0, likedByUser: false)
	
	@Published var dataArray = [PostModel]()
	
	// CommentView
	@Published var submissionText: String = ""
	@Published var commentArray = [CommentModel]()
	
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
	// MARK: -  FUNCTION
	
	func getComments() {
		print("Get comments from DB")
		
		let comment1 = CommentModel(commentID: "", userID: "", username: "Emma", content: "This is the first comment", dateCreated: Date())
		let comment2 = CommentModel(commentID: "", userID: "", username: "Alex", content: "This is the second comment", dateCreated: Date())
		let comment3 = CommentModel(commentID: "", userID: "", username: "Stefanie", content: "This is the third comment", dateCreated: Date())
		let comment4 = CommentModel(commentID: "", userID: "", username: "Christ", content: "This is the fourth comment", dateCreated: Date())
		
		self.commentArray.append(contentsOf: [comment1, comment2, comment3, comment4])
	}
}
