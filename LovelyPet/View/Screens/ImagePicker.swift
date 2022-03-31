//
//  ImagePicker.swift
//  LovelyPet
//
//  Created by Jacob Ko on 2022/03/31.
//

import Foundation
import SwiftUI

// UIViewControllerRepresentable is basically used to convert thing from UI kit to the SwiftUI format

struct ImagePicker: UIViewControllerRepresentable {
	// MARK: -  PROPERTY
	@Binding var imageSelected: UIImage
	@Binding var sourceType: UIImagePickerController.SourceType
	@Environment(\.presentationMode) var presentationMode
	
	// MARK: -  FUNCTION
	func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
		let picker = UIImagePickerController()
		picker.delegate = context.coordinator
		picker.sourceType = sourceType
		picker.allowsEditing = true // lets after you pick a original image it gives you the option to edit
		return picker
	}
	
	func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<ImagePicker>) {}
	
	func makeCoordinator() -> ImagePickerCoordinator {
		return ImagePickerCoordinator(parent: self)
	}
	
	class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
		
		let parent: ImagePicker
		
		init(parent: ImagePicker) {
			self.parent = parent
		}
		
		func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
			if let image = info[.editedImage] as? UIImage ?? info[.originalImage] as? UIImage {
				// select the image for our app
				parent.imageSelected = image
				// dismiss the screen
				parent.presentationMode.wrappedValue.dismiss()
			}
		}
	}
}
