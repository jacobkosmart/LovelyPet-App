//
//  LovelyPetApp.swift
//  LovelyPet
//
//  Created by Jacob Ko on 2022/03/25.
//

import SwiftUI

@main
struct LovelyPetApp: App {
	// MARK: -  PROPERTY
	@StateObject private var vm :PostViewModel = PostViewModel()
	// MARK: -  INIT
	
	// MARK: -  BODY
	var body: some Scene {
		WindowGroup {
			ContentView()
				.environmentObject(vm)
		}
	}
}
