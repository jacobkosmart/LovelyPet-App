//
//  PostModel.swift
//  LovelyPet
//
//  Created by Jacob Ko on 2022/03/26.
//

import Foundation
import SwiftUI

struct PostModel: Identifiable, Hashable {
	var id = UUID().uuidString
	var postID: String // ID for the post in DB
	var userID: String // ID for the user in Data
	var username: String // USername of user in DB
	var caption: String?
	var dateCreated: Date
	var likeCount: Int
	var likedByUser: Bool
	
	// It conforms to identifiable by having an ID and hash with this quick little function 
	func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
	// postID
	// userID
	// user username
	// caption - optional
	// date
	// like count
	// liked by current user
}
