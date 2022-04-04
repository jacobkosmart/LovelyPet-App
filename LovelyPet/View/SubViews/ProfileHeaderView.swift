//
//  ProfileHeaderView.swift
//  LovelyPet
//
//  Created by Jacob Ko on 2022/04/04.
//

import SwiftUI

struct ProfileHeaderView: View {
	// MARK: -  PROPERTY
	@Binding var profileDisplayName: String
	
	// MARK: -  BODY
	var body: some View {
		VStack (spacing: 10) {
			// MARK: -  Profile Picture
			Image("dog1")
				.resizable()
				.scaledToFill()
				.frame(width: 120, height: 120)
				.cornerRadius(60)
			// MARK: -  Username
			Text(profileDisplayName)
				.font(.largeTitle)
				.fontWeight(.bold)
			// MARK: -  Bio
			Text("이곳은 유저소개 페이지 공간 입니다!")
				.font(.body)
				.fontWeight(.regular)
				.multilineTextAlignment(.center)
			
			HStack (spacing: 20) {
				// MARK: -  Posts
				VStack (spacing: 5) {
					Text("5")
						.font(.title2)
						.fontWeight(.bold)
					
					Capsule()
						.fill(Color.gray)
						.frame(width: 20, height: 2)
					
					Text("포스트")
						.font(.callout)
						.fontWeight(.medium)
				} //: VSTACK
				
				// MARK: -  Likes
				VStack (spacing: 5) {
					Text("20")
						.font(.title2)
						.fontWeight(.bold)
					
					Capsule()
						.fill(Color.gray)
						.frame(width: 20, height: 2)
					
					Text("하트 수")
						.font(.callout)
						.fontWeight(.medium)
				} //: VSTACK
			} //: HSTACK
		} //: VSTACK
		.frame(maxWidth: .infinity)
		.padding()
	}
}

// MARK: -  PREVIEW
struct ProfileHeaderView_Previews: PreviewProvider {
	@State static var name: String = "Jacob"
	static var previews: some View {
		ProfileHeaderView(profileDisplayName: $name)
			.previewLayout(.sizeThatFits)
	}
}
