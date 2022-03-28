//
//  ContentView.swift
//  LovelyPet
//
//  Created by Jacob Ko on 2022/03/25.
//

import SwiftUI

struct ContentView: View {
	// MARK: -  PROPERTY
	
	// MARK: -  BODY
	var body: some View {
		TabView {
			NavigationView {
				FeedView()
			}
				.tabItem {
					Image(systemName: "book.fill")
					Text("포스트")
				}
			
			Text("Screen 2")
				.tabItem {
					Image(systemName: "magnifyingglass")
					Text("둘러보기")
				}
			
			Text("Screen 3")
				.tabItem {
					Image(systemName: "square.and.arrow.up.fill")
					Text("사진 올리기")
				}
			
			Text("Screen 4")
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
