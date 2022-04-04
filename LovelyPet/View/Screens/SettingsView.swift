//
//  SettingsView.swift
//  LovelyPet
//
//  Created by Jacob Ko on 2022/04/04.
//

import SwiftUI

struct SettingsView: View {
	// MARK: -  PROPERTY
	@EnvironmentObject var vm: PostViewModel
	@Environment(\.presentationMode) var presentationMode
	
	// MARK: -  BODY
	var body: some View {
		NavigationView {
			ScrollView(.vertical, showsIndicators: false) {
				// MARK: -  Section 1. Intro APP
				GroupBox {
					HStack (spacing: 10) {
						Image("logo")
							.resizable()
							.scaledToFit()
							.frame(width: 80, height: 80)
							.cornerRadius(12)
						
						Text("러블리 펫은 여러분의 사랑스러운 애완동물을 소개, 자랑하는 공간입니다. 당신의 펫의 소중한 기억들을 함께 공유해 보아요")
							.font(.footnote)
					} //: HSTACK
				} label: {
					SettingsLabelView(labelText: "러블리펫 소개", labelImage: "dot.radiowaves.left.and.right")
				} //: GROUP
				.padding()
				
				// MARK: -  Section 2. Profile
				GroupBox {
					
					NavigationLink {
						SettingsEditTextView(submissionText: "현재 닉네임", title: "현재 닉네임", description: "닉네임을 변경 하기 원하시면 아래에서 입력 한 후에, 저장 버튼을 눌러 주세요", placeholder: "닉네임 입력은 여기 입니다")
					} label: {
						SettingsRowView(leftIcon: "pencil", text: "닉네임 변경", color: Color.MyTheme.purpleColor)
					}
					
					NavigationLink {
						SettingsEditTextView(submissionText: "나의 소개글", title: "나의 소개글", description: "나를 소개해 보세요", placeholder: "소개글을 변경하기 원하면 아래에서 입력한 후에, 저장 버튼을 눌러 주세요")
					} label: {
						SettingsRowView(leftIcon: "text.quote", text: "나의 소개글", color: Color.MyTheme.purpleColor)
					}

					SettingsRowView(leftIcon: "photo", text: "프로필 사진 변경", color: Color.MyTheme.purpleColor)
					SettingsRowView(leftIcon: "figure.walk", text: "로그 아웃", color: Color.MyTheme.purpleColor)
				} label: {
					SettingsLabelView(labelText: "내 계정 설정", labelImage: "person.fill")
				} //: GROUP
				.padding(.horizontal)
				
				// MARK: -  SECTION 3. Application
				GroupBox {
					SettingsRowView(leftIcon: "folder.fill", text: "개인정보 보호", color: Color.MyTheme.yellowColor)
					SettingsRowView(leftIcon: "folder.fill", text: "앱 사용 약관", color: Color.MyTheme.yellowColor)
					SettingsRowView(leftIcon: "globe", text: "개발자 홈페이지", color: Color.MyTheme.yellowColor)
				} label: {
					SettingsLabelView(labelText: "앱 설정", labelImage: "apps.iphone")
				} //: GROUP
				.padding()
			
				
				// MARK: -  Section 4. Sign off
				GroupBox {
					Text("러블리 펫은 여러분의 사랑으로 운영됩니다. \n All Rights Reserved \n © Jacob Ko \n2022")
						.font(.footnote)
						.foregroundColor(.gray)
						.multilineTextAlignment(.center)
						.frame(maxWidth: .infinity)
				} //: GROUP
				.padding(.horizontal)
				.padding(.bottom, 80)

			} //: SCROLL
			.navigationBarTitle("설정")
			.navigationBarTitleDisplayMode(.large)
			.navigationBarItems(
				leading: Button(action: {
					presentationMode.wrappedValue.dismiss()
				}, label: {
					Image(systemName: "xmark")
						.font(.title)
				})
					.accentColor(.primary)
			)
		}
	}
}

// MARK: -  PREVIEW
struct SettingsView_Previews: PreviewProvider {
	static var previews: some View {
		SettingsView()
			.environmentObject(PostViewModel())
	}
}
