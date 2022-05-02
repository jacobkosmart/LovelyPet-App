//
//  SigninWithAppleButtonCustom.swift
//  LovelyPet
//
//  Created by Jacob Ko on 2022/05/02.
//

import Foundation
import SwiftUI
import AuthenticationServices

struct SigninWithAppleButtonCustom: UIViewRepresentable {
	func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
		return ASAuthorizationAppleIDButton(authorizationButtonType: .default, authorizationButtonStyle: .black)
	}
	
	func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {}
}
