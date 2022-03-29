//
//  CarouseView.swift
//  LovelyPet
//
//  Created by Jacob Ko on 2022/03/29.
//

import SwiftUI

struct CarouseView: View {
	// MARK: -  PROPERTY
	@EnvironmentObject private var vm: PostViewModel
	
	// MARK: -  BODY
	var body: some View {
		TabView (selection: $vm.selection) {
			ForEach(1..<vm.maxCount) {
				Image("dog\($0)")
					.resizable()
					.scaledToFill()
					.tag($0)
			} //: LOOP
		} //: TAB
		.tabViewStyle(PageTabViewStyle())
		.frame(height: 300)
		.animation(.easeInOut)
		// onApper 중복 방지하기 위해서 timerAdded 가 falser 일때 addTimer() 가 실행이 되고,
		// 실행되면 false 로 바꿔줌
		.onAppear {
			if !vm.timerAdded {
				vm.addTimer()
			}
		}
	}
}

// MARK: -  PREVIEW
struct CarouseView_Previews: PreviewProvider {
	static var previews: some View {
		CarouseView()
			.environmentObject(PostViewModel())
			.previewLayout(.sizeThatFits)
	}
}
