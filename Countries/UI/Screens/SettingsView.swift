//
//  SettingsView.swift
//  Countries
//
//  Created by Богдан Беннер on 2.05.23.
//

import SwiftUI

struct SettingsView: View {
	@AppStorage("appearanceMode") var appearanceMode = "Light"
	@EnvironmentObject private var router: Router
	
	var body: some View {
		let themes = ["Light", "Dark"]
		Form {
			Section("Appearance") {
				Picker("Mode", selection: $appearanceMode) {
					ForEach(themes, id: \.self) { Text($0) }
				}
				.pickerStyle(.segmented)
			}
			Section("Credits") {
				Text("Made by Bogdan Benner")
					.font(.title3)
					.foregroundColor(.gray)
				Link("GitHub", destination: URL(string: "https://github.com/c0pland")!)
				Link("LinkedIn", destination: URL(string: "https://linkedin.com/in/bennerbr")!)
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
