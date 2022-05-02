//
//  OnboardingView.swift
//  LovelyPet
//
//  Created by Jacob Ko on 2022/05/02.
//

import SwiftUI

struct OnboardingView: View {
	// MARK: -  PROPERTY
	// MARK: -  BODY
	var body: some View {
		VStack(spacing: 10) {
			Image("logo.transparent")
				.resizable()
				.scaledToFit()
				.frame(width: 100, height: 100)
				.shadow(radius: 12)
			
			Text("러블리 펫에 오신 여러분 환영합니다!")
				.font(.title2)
				.fontWeight(.bold)
				.foregroundColor(Color.MyTheme.purpleColor)
			
			Text("러블리 펫은 여러분의 사랑스러운 애완동물을 소개, 자랑하는 공간입니다. 당신의 펫의 소중한 기억들을 함께 공유해 보아요~")
				.font(.headline)
				.fontWeight(.medium)
				.multilineTextAlignment(.center)
				.foregroundColor(Color.MyTheme.purpleColor)
				.padding()
			
			// Apple Signin
			Button {
				
			} label: {
				SigninWithAppleButtonCustom()
					.frame(height: 60)
					.frame(maxWidth: .infinity)
			}
			
			// Google Signin
			Button {
				
			} label: {
				HStack {
					Image(systemName: "g.circle")
					
					Text("Sign in with Google")
				} //: HSTACK
				.frame(height: 60)
				.frame(maxWidth: .infinity)
				.background(Color(.sRGB, red: 222/255, green: 82/255, blue: 70/255, opacity: 1.0))
				.cornerRadius(5)
				.font(.system(size: 22, weight: .medium, design: .default))
			}
			.accentColor(Color.white)

		} //: VSTACK
		.padding(20)
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(Color.MyTheme.beigeColor)
		.ignoresSafeArea()
	}
}

// MARK: -  PREVIEW
struct OnboardingView_Previews: PreviewProvider {
	static var previews: some View {
		OnboardingView()
	}
}
