//
//  ProfileView.swift
//  LovelyPet
//
//  Created by Jacob Ko on 2022/04/04.
//

import SwiftUI

struct ProfileView: View {
	// MARK: -  PROPERTY
	@State var profileDisplayName: String
	@State var showSettings: Bool = false
	var isMyProfile: Bool
	var profileUserID: String
	// MARK: -  BODY
	var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			ProfileHeaderView(profileDisplayName: $profileDisplayName)
			
			ImageGridView()
		} //: SCROLL
		.navigationBarTitle("내 계정")
		.navigationBarTitleDisplayMode(.inline)
		.navigationBarItems(
			trailing:
				Button(action: {
					showSettings.toggle()
				}, label: {
					Image(systemName: "line.horizontal.3")
				})
				.accentColor(Color.MyTheme.purpleColor)
				.opacity(isMyProfile ? 1.0 : 0.0)
		)
		.sheet(isPresented: $showSettings) {
			SettingsView()
		}
	}
}

// MARK: -  PREVIEW
struct ProfileView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView{
			ProfileView(profileDisplayName: "Jacob", isMyProfile: true, profileUserID: "")
				.environmentObject(PostViewModel())
			
		}
	}
}
