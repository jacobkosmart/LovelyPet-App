//
//  SettingsRowView.swift
//  LovelyPet
//
//  Created by Jacob Ko on 2022/04/04.
//

import SwiftUI

struct SettingsRowView: View {
	// MARK: -  PROPERTY
	var leftIcon: String
	var text: String
	var color: Color
	
	// MARK: -  BODY
	var body: some View {
		HStack {
			ZStack {
				RoundedRectangle(cornerRadius: 8, style: .continuous)
					.fill(color)
				Image(systemName: leftIcon)
					.font(.title3)
					.foregroundColor(.white)
			} //: ZSTACK
			.frame(width: 36, height: 36)
			
			Text(text)
			
			Image(systemName: "chevron.right")
				.font(.headline)
				.hTrailing()
		} //: HSTACK
		.padding(.vertical, 4)
	}
}

// MARK: -  PREVIEW
struct SettingsRowView_Previews: PreviewProvider {
	static var previews: some View {
		SettingsRowView(leftIcon: "heart.fill", text: "Row Title", color: .red)
			.previewLayout(.sizeThatFits)
	}
}
