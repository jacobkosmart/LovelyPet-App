//
//  SettingsLabelView.swift
//  LovelyPet
//
//  Created by Jacob Ko on 2022/04/04.
//

import SwiftUI

struct SettingsLabelView: View {
	// MARK: -  PROPERTY
	var labelText: String
	var labelImage: String
	// MARK: -  BODY
	var body: some View {
		VStack {
			HStack {
				Text(labelText)
					.fontWeight(.bold)
				
				Image(systemName: labelImage)
					.hTrailing()
			} //: HSTACK
			
			Divider()
				.padding(.vertical, 4)
		} //: VSTACK
	}
}

// MARK: -  PREVIEW
struct SettingsLabelView_Previews: PreviewProvider {
	static var previews: some View {
		SettingsLabelView(labelText: "Test Label", labelImage: "heart")
			.previewLayout(.sizeThatFits)
	}
}
