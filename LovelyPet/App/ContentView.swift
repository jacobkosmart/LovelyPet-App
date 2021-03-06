//
//  ContentView.swift
//  LovelyPet
//
//  Created by Jacob Ko on 2022/03/25.
//

import SwiftUI

struct ContentView: View {
	// MARK: -  PROPERTY
	@EnvironmentObject private var vm: PostViewModel
	
	
	// MARK: -  BODY
	var body: some View {
		TabView {
			NavigationView {
				FeedView(posts: vm, title: "포스트")
			}
				.tabItem {
					Image(systemName: "book.fill")
					Text("포스트")
				}
			NavigationView {
				BrowseView()
			}
				.tabItem {
					Image(systemName: "magnifyingglass")
					Text("둘러보기")
				}
			
			UploadView()
				.tabItem {
					Image(systemName: "square.and.arrow.up.fill")
					Text("사진 올리기")
				}
			
			ZStack {
				if vm.currentUserID != nil {
					NavigationView{
						ProfileView(profileDisplayName: "내 프로필", isMyProfile: true, profileUserID: "")
					}
				} else {
					SignUpView()
				}
			}
				.tabItem {
					Image(systemName: "person.fill")
					Text("내 계정")
				}
		} //: TAB
		.accentColor(Color.MyTheme.purpleColor)
	}
}

// MARK: -  PREVIEW
struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
			.environmentObject(PostViewModel())
	}
}
