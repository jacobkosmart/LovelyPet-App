//
//  PostView.swift
//  LovelyPet
//
//  Created by Jacob Ko on 2022/03/25.
//

import SwiftUI

struct PostView: View {
	// MARK: -  PROPERTY
	
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
				
				Text("User name here")
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
				
				Image(systemName: "bubble.middle.bottom")
					.font(.title3)
				
				Image (systemName: "paperplane")
					.font(.title3)
			} //: HSTACK
			.hLeading()
			.padding(10)
			
			HStack {
				Text("This is the Caption for the photo!")
			} //: HSTACK
			.hLeading()
			.padding(10)
		} //: VSTACK
	}
}

// MARK: -  PREVIEW
struct PostView_Previews: PreviewProvider {
	static var previews: some View {
		PostView()
			.previewLayout(.sizeThatFits)
	}
}
