//
//  OnboardingViewPart2.swift
//  LovelyPet
//
//  Created by Jacob Ko on 2022/05/02.
//

import SwiftUI

struct OnboardingViewPart2: View {
	// MARK: -  PROPERTY
	@EnvironmentObject var vm: PostViewModel
	
	// MARK: -  BODY
	var body: some View {
		VStack (spacing: 20) {
			Text("당신의 이름은 어떻게 되십니까?")
				.font(.title2)
				.fontWeight(.bold)
				.foregroundColor(Color.MyTheme.yellowColor)
			
			TextField("이름을 적어주세요...", text: $vm.displayName)
				.padding()
				.frame(height: 60)
				.frame(maxWidth: .infinity)
				.background(Color.MyTheme.beigeColor)
				.cornerRadius(12)
				.font(.headline)
				.autocapitalization(.sentences)
				.padding(.horizontal)
			
			Button {
				vm.showImagePickerinOnboarding.toggle()
			} label: {
				Text("프로필 사진을 등록해 주세요")
					.font(.headline)
					.fontWeight(.bold)
					.padding()
					.frame(height: 60)
					.frame(maxWidth: .infinity)
					.background(Color.MyTheme.yellowColor)
					.cornerRadius(12)
					.padding(.horizontal)
			}
			.accentColor(Color.MyTheme.purpleColor)
			.opacity(vm.displayName != "" ? 1.0 : 0.0)
			.animation(.easeInOut(duration: 1.0))
		} //: VSTACK
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(Color.MyTheme.purpleColor)
		.ignoresSafeArea()
		.sheet(isPresented: $vm.showImagePickerinOnboarding, onDismiss: vm.createProfile, content: {
			ImagePicker(imageSelected: $vm.imageSelectedinOnbording, sourceType: $vm.sourceTypeinOnboarding)
		})
	}
}

// MARK: -  PREVIEW
struct OnboardingViewPart2_Previews: PreviewProvider {
	static var previews: some View {
		OnboardingViewPart2()
			.environmentObject(PostViewModel())
	}
}
