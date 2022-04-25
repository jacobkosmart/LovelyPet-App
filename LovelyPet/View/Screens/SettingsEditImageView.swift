//
//  SettingsEditImageView.swift
//  LovelyPet
//
//  Created by Jacob Ko on 2022/04/25.
//

import SwiftUI

struct SettingsEditImageView: View {
	// MARK: -  PROPERTY
	@State var title: String
	@State var description: String
	
	@State var seledtedImage: UIImage // Image shown on this screen
	@State var showImagePicker: Bool = false
	@State var sourceType: UIImagePickerController.SourceType = UIImagePickerController.SourceType.photoLibrary
	
	// MARK: -  BODY
	var body: some View {
		VStack (alignment: .leading, spacing: 20) {
			
			// title
			Text(description)
				.hLeading()
			
			// currentImage
			Image(uiImage: seledtedImage)
				.resizable()
				.scaledToFill()
				.frame(width: 200, height: 200)
				.clipped()
				.cornerRadius(20)
			
			// loadImage
			Button {
				showImagePicker.toggle()
			} label: {
				Text("사진 가져오기")
					.font(.title3)
					.foregroundColor(Color.MyTheme.purpleColor)
					.fontWeight(.bold)
					.padding()
					.frame(height: 60)
					.frame(maxWidth: .infinity)
					.background(Color.MyTheme.yellowColor.cornerRadius(12))
			}
			.sheet(isPresented: $showImagePicker) {
				ImagePicker(imageSelected: $seledtedImage, sourceType: $sourceType)
			}
			
			// saveImage
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
struct SettingsEditImageView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			SettingsEditImageView(title: "테스트 타이틀", description: "설명", seledtedImage: UIImage(named: "dog1")!)
		}
	}
}
