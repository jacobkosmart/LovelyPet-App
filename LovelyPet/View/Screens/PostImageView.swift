//
//  PostImageView.swift
//  LovelyPet
//
//  Created by Jacob Ko on 2022/04/01.
//

import SwiftUI

struct PostImageView: View {
	// MARK: -  PROPERTY
	@EnvironmentObject private var vm: PostViewModel
	@Environment(\.presentationMode) var presentationMode
	@Binding var imageSelected: UIImage
	
	// MARK: -  BODY
	var body: some View {
		VStack (spacing: 0) {
			HStack {
				Button {
					presentationMode.wrappedValue.dismiss()
				} label: {
					Image(systemName: "xmark")
						.font(.title)
						.padding()
				}
			.accentColor(.primary)
			.hLeading()
			} //: HSTACK
			
			ScrollView(.vertical, showsIndicators: false) {
				VStack (spacing: 20) {
					Image(uiImage: imageSelected)
						.resizable()
						.scaledToFill()
						.frame(width: 200, height: 200, alignment: .center)
						.cornerRadius(15)
						.clipped()
					
					TextField("당신의 메세지를 입력해주세요..", text: $vm.captionText)
						.font(.headline)
						.padding()
						.frame(height: 60)
						.frame(maxWidth: .infinity)
						.background(Color.MyTheme.beigeColor.cornerRadius(15))
						.padding(.horizontal)
						.autocapitalization(.sentences)
					
					Button {
						vm.postPicture()
					} label: {
						Text("사진 업로드")
							.font(.title3)
							.fontWeight(.bold)
							.padding()
							.frame(height: 60)
							.frame(maxWidth: .infinity)
							.background(Color.MyTheme.purpleColor.cornerRadius(15))
							.padding(.horizontal)
					}
					.accentColor(Color.MyTheme.yellowColor)
				} //: VSTACK
			} //: SCROLL
		} //: VSTACK
	}
}

// MARK: -  PREVIEW
struct PostImageView_Previews: PreviewProvider {
	@State static var image = UIImage(named: "dog1")!
	static var previews: some View {
		PostImageView(imageSelected: $image)
			.environmentObject(PostViewModel())
	}
}
