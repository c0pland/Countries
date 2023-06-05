//
//  SettingsView.swift
//  Countries
//
//  Created by Богдан Беннер on 2.05.23.
//

import SwiftUI

struct SettingsView: View {
	// @AppStorage("appearanceMode") var appearanceMode: AppearanceMode = .automatic
	@EnvironmentObject private var router: Router
	
	var body: some View {
		Form {
			Section("Appearance") {
				Toggle("Dark", isOn: .constant(true))
			}
		}
		.navigationTitle(router.navigationTitle)
	}
}

struct SettingsView_Previews: PreviewProvider {
	static var previews: some View {
		SettingsView()
			.environmentObject(Router())
	}
}
