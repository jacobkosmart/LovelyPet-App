//
//  CommentModel.swift
//  LovelyPet
//
//  Created by Jacob Ko on 2022/03/28.
//

import Foundation
import SwiftUI

struct CommentModel: Identifiable, Hashable {
	var id = UUID().uuidString
	var commentID: String // ID for the comment in the DB
	var userID: String // ID for the user in the DB
	var username: String // Username for the in the DB
	var content: String // Actually comment text
	var dateCreated: Date
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
}
