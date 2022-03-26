//
//  CommentsView.swift
//  LovelyPet
//
//  Created by Jacob Ko on 2022/03/26.
//

import SwiftUI

struct CommentsView: View {
	// MARK: -  PROPERTY
	@EnvironmentObject private var vm : PostViewModel
	// MARK: -  BODY
	var body: some View {
		VStack {
			ScrollView {
				Text("Placeholder")
				Text("Placeholder")
				Text("Placeholder")
				Text("Placeholder")
			} //: SCROLL
			
			HStack {
				Image("dog1")
					.resizable()
					.scaledToFill()
					.frame(width: 40, height: 40)
					.cornerRadius(20)
				
				TextField("댓글을 여기에 써주세요.", text: $vm.submissionText)
				
				Button {
					
				} label: {
					Image(systemName: "paperplane.fill")
						.font(.title2)
				}
				.accentColor(Color.MyTheme.purpleColor)
			} //: HSTACK
			.padding(10)
		} //: VSTACK
		.navigationBarTitle("댓글 보기")
		.navigationBarTitleDisplayMode(.inline)
	}
}

// MARK: -  PREVIEW
struct CommentsView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView{
			CommentsView()
				.environmentObject(PostViewModel())
		}
	}
}
