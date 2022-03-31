//
//  UploadView.swift
//  LovelyPet
//
//  Created by Jacob Ko on 2022/03/31.
//

import SwiftUI

struct UploadView: View {
	// MARK: -  PROPERTY
	
	// MARK: -  BODY
	var body: some View {
		ZStack {
			VStack (spacing: 0) {
				Button {
					
				} label: {
					Text("사진 촬영")
						.font(.largeTitle)
						.fontWeight(.bold)
						.foregroundColor(Color.MyTheme.yellowColor)
				}
				.frame(maxWidth: .infinity, maxHeight: .infinity)
				.background(Color.MyTheme.purpleColor)
				
				Button {
					
				} label: {
					Text("사진 가져오기")
						.font(.largeTitle)
						.fontWeight(.bold)
						.foregroundColor(Color.MyTheme.purpleColor)
				}
				.frame(maxWidth: .infinity, maxHeight: .infinity)
				.background(Color.MyTheme.yellowColor)

			} //: VSTACK
			
			// Logo
			Image("logo.transparent")
				.resizable()
				.scaledToFit()
				.frame(width: 100, height: 100)
				.shadow(radius: 20)
		} //: ZSTACK
		.ignoresSafeArea(edges: .top)
	}
}

// MARK: -  PREVIEW
struct UploadView_Previews: PreviewProvider {
	static var previews: some View {
		UploadView()
	}
}
