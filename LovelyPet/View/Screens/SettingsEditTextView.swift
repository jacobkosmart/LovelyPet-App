//
//  SettingsEditTextView.swift
//  LovelyPet
//
//  Created by Jacob Ko on 2022/04/04.
//

import SwiftUI

struct SettingsEditTextView: View {
	// MARK: -  PROPERTY
	@State var submissionText: String = ""
	@State var title: String
	@State var description: String
	@State var placeholder: String
	// MARK: -  BODY
	var body: some View {
		VStack (spacing: 20) {
			
			Text(description)
				.hLeading()
			
			TextField(placeholder, text: $submissionText)
				.padding()
				.frame(height: 60)
				.frame(maxWidth: .infinity)
				.background(Color.MyTheme.beigeColor.cornerRadius(12))
				.font(.headline)
			
			Button {
				
			} label: {
				Text("저장하기")
					.font(.title3)
					.foregroundColor(Color.MyTheme.yellowColor)
					.fontWeight(.bold)
					.padding()
					.frame(height: 60)
					.frame(maxWidth: .infinity)
					.background(Color.MyTheme.purpleColor.cornerRadius(12))
			}

			Spacer()
		} //: VSTACK
		.padding()
		.frame(maxWidth: .infinity)
		.navigationBarTitle(title)
	}
}

// MARK: -  PREVIEW
struct SettingsEditTextView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			SettingsEditTextView(title: "테스트 타이틀", description: "설명", placeholder: "여기에 입력하세요")
		}
	}
}
