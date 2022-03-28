//
//  MessageView.swift
//  LovelyPet
//
//  Created by Jacob Ko on 2022/03/28.
//

import SwiftUI

struct MessageView: View {
	// MARK: -  PROPERTY
	@State var comment: CommentModel
	// MARK: -  BODY
	var body: some View {
		HStack {
			// MARK: -  Profile Image
			Image("dog1")
				.resizable()
				.scaledToFill()
				.frame(width: 40, height: 40)
				.cornerRadius(20)
			
			VStack (alignment: .leading, spacing: 4) {
				// MARK: -  User Name
				Text(comment.username)
					.font(.caption)
					.foregroundColor(.gray)
				
				// MARK: -  Content
				Text(comment.content)
					.foregroundColor(.primary)
					.padding(10)
					.background(Color.gray.cornerRadius(10))
			} //: VSTACK
			.hLeading()
			
		} //: HSTACK
	}
}

// MARK: -  PREVIEW
struct MessageView_Previews: PreviewProvider {
	
	static var comment: CommentModel = CommentModel(commentID: "", userID: "", username: "Jacob", content: "This photo is really cool", dateCreated: Date())
	
	static var previews: some View {
		MessageView(comment: comment)
			.previewLayout(.sizeThatFits)
	}
}
