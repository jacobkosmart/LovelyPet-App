//
//  SignUpView.swift
//  LovelyPet
//
//  Created by Jacob Ko on 2022/04/26.
//

import SwiftUI

struct SignUpView: View {
	// MARK: -  PROPERTY
	// MARK: -  BODY
	var body: some View {
		VStack(spacing: 20) {
			Spacer()
			Image("logo.transparent")
				.resizable()
				.scaledToFit()
				.frame(width: 100, height: 100)
			
			Text("아직 로그인 중이 아닙니다!")
				.font(.largeTitle)
				.fontWeight(.bold)
				.lineLimit(1)
				.minimumScaleFactor(0.5)
				.foregroundColor(Color.MyTheme.purpleColor)
			
			Text("로그인 및 회원가입 하시려면 아래 버튼을 눌러주세요")
				.font(.headline)
				.fontWeight(.medium)
				.multilineTextAlignment(.center)
			
			Button {
				
			} label: {
				Text("로그인 / 회원가입")
					.font(.headline)
					.fontWeight(.bold)
					.padding()
					.frame(maxWidth: .infinity)
					.frame(height: 60)
					.background(Color.MyTheme.purpleColor)
					.cornerRadius(12)
					.shadow(radius: 12)
			}
			.accentColor(Color.MyTheme.yellowColor)
			
			Spacer()
			Spacer()
		} //: VSTACK
		.padding(40)
		.background(Color.MyTheme.yellowColor)
		.ignoresSafeArea(edges: .top)
	}
}

// MARK: -  PREVIEW
struct SignUpView_Previews: PreviewProvider {
	static var previews: some View {
		SignUpView()
	}
}
